import 'package:diamondcalculator/Animation/FadeAnimation.dart';
import 'package:diamondcalculator/Constant.dart';
import 'package:diamondcalculator/data/DiamondPrice.dart';
import 'package:diamondcalculator/presentation/custom_icons.dart';
import 'package:diamondcalculator/screens/aboutus_screen.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class DiamondShape {
  IconData icon;
  String value;

  DiamondShape(this.icon, this.value);
}

var DiamondShapeList = [
  DiamondShape(Custom.round, "Round"),
  DiamondShape(Custom.pear, "Pear"),
  DiamondShape(Custom.asscher, "Asscher"),
  DiamondShape(Custom.cushion, "Cushion"),
  DiamondShape(Custom.emerald, "Emerald"),
  DiamondShape(Custom.heart, "Heart"),
  DiamondShape(Custom.marquise, "Marquise"),
  DiamondShape(Custom.oval, "Oval"),
  DiamondShape(Custom.princess, "Princess"),
  DiamondShape(Custom.radiant, "Radiant"),
];

typedef ValueChangeCallback = void Function(String v);

class _CalculatorScreenState extends State<CalculatorScreen> {
  String dShape = "Round";
  String dColor = "D";
  String dClarity = "IF";
  double dCaret = 1.0;
  bool dDiscountPositive = false;
  double dDiscount = 0;
  double dDiscountPrice = 0;
  double dRapPrCtPrice;
  TextEditingController discountTxt = TextEditingController();
  TextEditingController caretTxt = TextEditingController();
  InterstitialAd interstitialAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discountTxt.text = "0";
    caretTxt.text = "1.0";
    interstitialAd = myInterstitial()..load();
  }
  InterstitialAd myInterstitial() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-4181876387693872/2850126757",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          interstitialAd = myInterstitial()..load();
        }
      },
    );
  }


  @override
  void dispose() {
    interstitialAd?.dispose();
    super.dispose();
  }


  void onCalculatePressed() {
    if (dCaret < 0 || dCaret > 5) {
      Toast.show("Caret should be between 0 and 5", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      return;
    }
    if (dDiscount < 0 || dDiscount > 90) {
      Toast.show("Discount should be between 0 and 90%", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      return;
    }

    interstitialAd
      ..load()
      ..show();

    double rapPrCtPrice = calculatePrice(dCaret, dShape, dColor, dClarity);
    dDiscountPrice = dDiscountPositive
        ? rapPrCtPrice + rapPrCtPrice * dDiscount / 100
        : rapPrCtPrice - rapPrCtPrice * dDiscount / 100;
    setState(() {
      dRapPrCtPrice = rapPrCtPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutUsScreen()));
            },
          ),
        ],
        title: Row(
          children: <Widget>[
            Image(
              image: Svg('assets/diamond.svg'),
              width: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: kPrimaryDarkColor2,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
//        color: kPrimaryDarkColor2,
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              child: Wrap(
                runSpacing: 22,
                spacing: 22,
                children: <Widget>[
                  FadeAnimation(
                      2.2,
                      PriceField1(
                          title: "RAP Price / CT.", price: dRapPrCtPrice)),
                  FadeAnimation(
                      2,
                      PriceField2(
                        title: "Discount",
                        isDiscountPositive: dDiscountPositive,
                        onDiscountTypeChange: (v) {
                          setState(() {
                            dDiscountPositive = !dDiscountPositive;
                          });
                        },
                        value: dDiscount,
                        onDiscountChange: (v) {
                          try {
                            if (v.trim().isEmpty) v = "0.0";
                            setState(() {
                              dDiscount = double.parse(v);
                            });
                          } catch (e) {
                            Toast.show(
                                "Discount is not in valid format.", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.TOP);
                          }
                        },
                        txtController: discountTxt,
                      )),
                  FadeAnimation(1.8,
                      PriceField1(title: "Price / CT.", price: dDiscountPrice)),
                  FadeAnimation(
                      1.6,
                      PriceField1(
                          title: "Total Price",
                          price: dDiscountPrice * dCaret)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 373,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 22),
                    FadeAnimation(
                        1.4,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Carat",
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                    SizedBox(
                      height: 14,
                    ),
                    FadeAnimation(
                        1.3,
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          height: 42,
                          decoration: BoxDecoration(
                            color: kPrimaryDarkColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: -10.0,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: caretTxt,
                            keyboardType: TextInputType.number,
                            onChanged: (v) {
                              try {
                                if (v.trim().isEmpty) v = "0.0";
                                dCaret = double.parse(v.trim());
                              } catch (e) {
                                Toast.show(
                                    "Caret is not in valid format.", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.TOP);
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Caret (ex. 1.3)",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                    SizedBox(
                      height: 22,
                    ),
                    FadeAnimation(1.1, Header2(title: "Shape", value: dShape)),
                    FadeAnimation(
                        1,
                        Container(
                          height: 113,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            children: DiamondShapeList.map((d) {
                              return (ShapeButton(
                                icon: d.icon,
                                isActive: d.value == dShape,
                                value: d.value,
                                valueChangeCallback: (String v) {
                                  setState(() {
                                    dShape = v;
                                  });
                                },
                              ));
                            }).toList(),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(0.8, Header2(title: "Color", value: dColor)),
                    FadeAnimation(
                        0.7,
                        Container(
                          height: 83,
                          child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              scrollDirection: Axis.horizontal,
                              children:
                                  ["D", "E", "F", "G", "H", "I", "J"].map((d) {
                                return ButtonType1(
                                  title: d,
                                  isActive: d == dColor,
                                  valueChangeCallback: (v) {
                                    setState(() {
                                      dColor = v;
                                    });
                                  },
                                );
                              }).toList()),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        0.5, Header2(title: "Clarity", value: dClarity)),
                    FadeAnimation(
                        0.4,
                        Container(
                          height: 83,
                          child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              scrollDirection: Axis.horizontal,
                              children: [
                                "IF",
                                "VVS1",
                                "VVS2",
                                "VS1",
                                "VS2",
                                "SI1",
                                "SI2"
                              ].map((c) {
                                return ButtonType1(
                                  title: c,
                                  isActive: c == dClarity,
                                  valueChangeCallback: (v) {
                                    setState(() {
                                      dClarity = v;
                                    });
                                  },
                                );
                              }).toList()),
                        ))
                  ],
                ),
              ),
            ),
            FadeAnimation(
                0.2,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: <Widget>[
//              Expanded(child: RaisedButton(child: Text("Search"),),),
//              SizedBox(width: 16,),
                      Expanded(
                        child: RaisedButton(
                          color: kAccentColor,
                          child: Text(
                            "Calculate",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          onPressed: onCalculatePressed,
                        ),
                      )
                    ],
                  ),
                )),
//            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  final String title;
  final String value;
  final ValueChangeCallback valueChangeCallback;

  const Header2({
    Key key,
    this.title,
    this.value,
    this.valueChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "$title : "),
            TextSpan(text: value, style: TextStyle(fontWeight: FontWeight.w800))
          ],
          style: TextStyle(fontSize: 16),
        ),

//                  style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class ButtonType1 extends StatelessWidget {
  final String title;
  final bool isActive;
  final ValueChangeCallback valueChangeCallback;

  const ButtonType1({
    Key key,
    this.title,
    this.isActive = false,
    this.valueChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueChangeCallback(title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kPrimaryDarkColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 10.0,
                    offset: Offset(
                      4.0, // Move to right 10  horizontally
                      4.0, // Move to bottom 10 Vertically
                    ),
                  )
                : BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 26),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class ShapeButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final String value;
  final ValueChangeCallback valueChangeCallback;

  const ShapeButton({
    Key key,
    this.icon,
    this.isActive = false,
    this.value,
    this.valueChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        valueChangeCallback(value);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kPrimaryDarkColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 10.0,
                    offset: Offset(
                      4.0, // Move to right 10  horizontally
                      4.0, // Move to bottom 10 Vertically
                    ),
                  )
                : BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  )
          ],
        ),
        width: 80,
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          size: 46,
        ),
      ),
    );
  }
}

class PriceField1 extends StatelessWidget {
  final String title;
  final double price;

  const PriceField1({
    Key key,
    this.title,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 11,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kPrimaryDarkColor3, kPrimaryDarkColor],
                    stops: [0.2, 0.2]),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\$",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        (price != null) ? price.toStringAsFixed(2) : "-",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class PriceField2 extends StatelessWidget {
  final String title;
  final bool isDiscountPositive;
  final double value;
  final ValueChangeCallback onDiscountTypeChange;
  final ValueChangeCallback onDiscountChange;
  final TextEditingController txtController;

  const PriceField2(
      {Key key,
      this.title,
      this.isDiscountPositive,
      this.value,
      this.onDiscountTypeChange,
      this.onDiscountChange,
      this.txtController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 11,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
                text: TextSpan(
              children: [
                TextSpan(text: "$title : "),
                TextSpan(
                    text: (isDiscountPositive ? "+" : "-") +
                        this.value.toString() +
                        "%",
                    style: TextStyle(fontWeight: FontWeight.w800))
              ],
              style: TextStyle(fontSize: 16),
            )),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 42,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  kAccentColor,
                  kPrimaryDarkColor,
                  kPrimaryDarkColor,
                  kPrimaryDarkColor3
                ], stops: [
                  0.2,
                  0.2,
                  0.8,
                  0.8
                ]),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: () {
                        onDiscountTypeChange("1");
                      },
                      padding: EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          isDiscountPositive ? "+" : "-",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: onDiscountChange,
                        controller: txtController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Discount",
                            hintStyle: TextStyle(color: Colors.grey[400])),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "%",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
