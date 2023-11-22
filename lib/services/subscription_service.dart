// import 'package:ordersum/app/app.locator.dart';
// import 'package:ordersum/app/app.logger.dart';
// import 'package:ordersum/app/app.router.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app/app.locator.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'dart:convert';

import 'package:todo_app/app/app.logger.dart';
import 'package:todo_app/app/app.router.dart';

class SubscriptionService {
  final logger = getLogger('SubscriptionService');
  final _dialogService = locator<DialogService>();
  final _navigatorService = locator<NavigationService>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final supabase = Supabase.instance.client;

  // define constructor
  SubscriptionService() {
    logger.i("*********Subscription Service Started*********");
  }

  Future<void> handleSubscriptionApproval() async {
    String userId = supabase.auth.currentUser!.id;

    supabase.channel('public:profile:id=eq.$userId').on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
        event: 'UPDATE',
        schema: 'public',
        table: 'profile',
        filter: 'id=eq.$userId',
      ),
      (payload, [ref]) {
        //logger.i('Change received: ${payload.toString()}');
        //final jsonMap = json.decode(payload.toString());
        final approved = payload['new']['approved'];

        logger.i('subscription approved :$approved');

        if (approved) {
          setSubscriptionTokenInApp();
        }
      },
    ).subscribe();
  }

  Future<void> setSubscriptionTokenInApp() async {
    logger.i("*********Setting Subscription Token*********");

    final SharedPreferences prefs = await _prefs;
    logger.i('start of getting subscription data from supabase');
    final data = await supabase.from('profile').select('jwt_token,approved');
    logger.i('end of getting subscription data from supabase');

    final jwtToken = data[0]['jwt_token'] ?? '';
    final approved = data[0]['approved'] ?? false;

    logger.i("Subscription JWT Token: $jwtToken");
    prefs.setString('SubscriptionKey', jwtToken);
    prefs.setBool('SubscriptionApproved', approved);
  }

  //check if the subscription is active by checking the jwt token expiry and retur true or false
  Future<bool> isSubscriptionActive() async {
    final SharedPreferences prefs = await _prefs;
    final String subKeyJwt = (prefs.getString('SubscriptionKey') ?? "");
    final bool subApproval = (prefs.getBool('SubscriptionApproved') ?? false);

    bool hasSubscription = false;
    if (subKeyJwt != "") {
      hasSubscription = JwtDecoder.isExpired(subKeyJwt);
      hasSubscription = !hasSubscription;
    }

    hasSubscription = hasSubscription && subApproval;

    logger.i("Subscription Active: $hasSubscription");
    return hasSubscription;
  }

  Future<void> subscriptionSuccessful() async {
    logger.i("********* Generating Subscription Token  *********");
    await hs256();
    await setSubscriptionTokenInApp();

    //show dialog
    await _dialogService.showDialog(
      title: 'Subscription Successful',
      description: """You have successfully subscribed to OrderSum.
      \nPlease SEND the SNAPSHOT of payment to admin (WhatsApp - +918087587084) and wait for approval from the admin.
      \nAdmin will contact you soon with status""",
    );

    _navigatorService.clearStackAndShow(Routes.homeView);
  }

  Future<void> hs256() async {
    String token;

    /* Sign */ {
      // Create a json web token
      final jwt = JWT(
        {
          'id': 123,
          'server': {
            'id': '3e4fc296',
            'loc': 'euw-2',
          }
        },
        issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
      );

      // Sign it
      token = jwt.sign(SecretKey('secret passphrase'),
          expiresIn: const Duration(days: 30));
      logger.i('Signed token: $token\n');

      logger.i('starting to update the subscription token in supabase');
      await supabase.from('profile').update({
        'jwt_token': token,
        'display_name': supabase.auth.currentUser?.phone,
        'approved': false
      }).eq('id', supabase.auth.currentUser!.id);
      logger.i('end of updating the subscription token in supabase');
    }

    /* Verify */ {
      // try {
      //   // Verify a token
      //   final jwt = JWT.verify(token, SecretKey('secret passphrase'));

      //   print('Payload: ${jwt.payload}');
      // } on JWTExpiredException {
      //   print('jwt expired');
      // } on JWTException catch (ex) {
      //   print(ex.message); // ex: invalid signature
      // }
    }
  }
}
