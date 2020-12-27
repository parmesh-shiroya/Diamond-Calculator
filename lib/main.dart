import 'package:diamondcalculator/Constant.dart';

import 'package:diamondcalculator/screens/calculator_screen.dart';
import 'package:diamondcalculator/screens/splash_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: kAdmobID);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackgroudColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        accentColor: kAccentColor,
        primaryColor: kPrimaryColor,

        textTheme: GoogleFonts.sourceSansProTextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        primaryColorDark: kPrimaryDarkColor,
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0.0),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
