import 'dart:async';

import 'package:diamondcalculator/Animation/FadeAnimation.dart';
import 'package:diamondcalculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => {_checkUser()});
  }

  int appVersion = 1;

  void _checkUser() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) =>
            CalculatorScreen(title: 'Calculator')));
  }

  bool run = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
              0.8,
          Image.asset(
            'assets/diamond_shadow.png',
            width: 180,
          )),
          SizedBox(height: 20,),
          FadeAnimation(
            0.2,
          Text(
            "Diamond Calculator",
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.8),
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          )
          )
        ],
      )),
    ));
  }
}
