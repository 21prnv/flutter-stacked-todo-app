import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.logger.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/subscription_service.dart';

class LoginService {
  final logger = getLogger('LoginService');
  final supabase = Supabase.instance.client;

  final _subscriptionService = locator<SubscriptionService>();
  final _navigationService = locator<NavigationService>();

  Future<bool> isLoggedIn() async {
    final User? user = supabase.auth.currentUser;
    logger.i('User: $user');
    return user != null;
  }

  bool isSessionActive() {
    final Session? session = supabase.auth.currentSession;
    return session != null;
  }

  Future<void> sendOTP(String mobileNumberWithCountryCode) async {
    await supabase.auth.signInWithOtp(phone: mobileNumberWithCountryCode
        //channel: OtpChannel.whatsapp,
        );
    logger.i('OTP sent to $mobileNumberWithCountryCode');
  }

  Future<AuthResponse> verifyOTP(
      String mobileNumberWithCountryCode, String otp) async {
    try {
      final AuthResponse res = await supabase.auth.verifyOTP(
        type: OtpType.sms,
        token: otp,
        phone: mobileNumberWithCountryCode,
      );
      logger.i('OTP verified for $mobileNumberWithCountryCode');
      logger.i('User: ${res.user}');

      if (res.user != null) {
        await _subscriptionService.setSubscriptionTokenInApp();
        // await _subscriptionService.handleSubscriptionApproval();
      }

      return res;
    } catch (e) {
      // Handle the exception
      logger.e('Error verifying OTP: $e');
      // You may want to throw or return a specific error response here
      _navigationService.navigateToHomeView();
    }
    return AuthResponse();
  }

  void logout() async {
    await supabase.auth.signOut();
    logger.i('User logged out');
  }
}
