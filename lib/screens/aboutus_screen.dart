import 'dart:async';
import 'package:diamondcalculator/Animation/FadeAnimation.dart';
import 'package:diamondcalculator/Constant.dart';
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
            "About",
            style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w600),
          ),
        ),
        body: Container(

          child: Padding(
            padding: EdgeInsets.only(top: 10),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Card(
                    color: kPrimaryDarkColor2,
                    child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Note: This app shows price from the report that diamond selling companies use to calculate diamond prices. Market prices can be a few percent different then this App shows.",
                      textAlign: TextAlign.center
                    ),
                  ),),
                  ),
              Padding(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Card(
                  color: kPrimaryDarkColor2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "For any queries or feature request please contact us on below platform. We would like to here from you. \n Thank You",
                        textAlign: TextAlign.center
                    ),
                  ),),
              ),

              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: FadeAnimation(
                    0.8,
                    Image.asset(
                      'assets/company_logo.png',
                      width: 180,
                    )),
              ),
              SizedBox(
                height: 10,
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
                        height: 40,
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
                          )),SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                          0.2,
                          GestureDetector(
                            onTap: (){
                              launch("https://wa.me/917990709318?text=For%20Diamond%20Calculator");
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image: Svg('assets/ic_whatsapp.svg'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+91 79907 09318",
                                  style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      FadeAnimation(
                          0.2,
                          GestureDetector(
                            onTap: (){
                              launch("https://wa.me/919924756555?text=For%20Diamond%20Calculator");
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(
                                  image: Svg('assets/ic_whatsapp.svg'),
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+91 99247 56555",
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
