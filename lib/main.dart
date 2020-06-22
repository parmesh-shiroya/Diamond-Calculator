import 'package:diamondcalculator/Constant.dart';
import 'package:diamondcalculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: CalculatorScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
