import 'dart:async';
import 'package:diamondcalculator/Animation/FadeAnimation.dart';
import 'package:diamondcalculator/screens/calculator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About us",
            style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(

          child: Padding(
            padding: EdgeInsets.only(top: 120),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: FadeAnimation(
                    0.8,
                    Image.asset(
                      'assets/company_logo.png',
                      width: 200,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          0.5,
                          GestureDetector(
                            onTap: (){
                              launch("mailto:color9infotech@gmail.com?subject=Diamond Calculator Query&body=Write here");
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.alternate_email),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "color9infotech@gmail.com",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                          0.2,
                          GestureDetector(
                            onTap: (){
                              launch("tel:+919510951131");
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+91 95109 51131",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ],
          )),
        ));
  }
}
