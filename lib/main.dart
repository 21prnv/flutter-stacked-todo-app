import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:todo_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await Supabase.initialize(
    url: 'https://qmosflnjhthvgnodyune.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFtb3NmbG5qaHRodmdub2R5dW5lIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk2MjQ4NjksImV4cCI6MjAxNTIwMDg2OX0.FvSyGzj4s-zpLlix3_061gmUaJ9aDvdR3mn0RpcBckk',
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("9e024891-6411-4c2b-a13b-dc76bffe12e4");
  OneSignal.Notifications.requestPermission(true);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
