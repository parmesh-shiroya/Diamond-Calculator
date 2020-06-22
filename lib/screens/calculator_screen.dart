import 'package:diamondcalculator/Constant.dart';
import 'package:diamondcalculator/presentation/custom_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
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
                PriceField1(title: "RAP Price / CT.", price: 1.6),
                PriceField1(title: "Price / CT.", price: 1.6),
                PriceField2(title: "Discount"),
                PriceField1(title: "Total Price", price: 1.6),
              ],
            ),
          ),
          Container(
            height:  MediaQuery.of(context).size.height - 373,
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Carat",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Discount",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Header2(title:"Shape",value:"Round"),
                  Container(
                    height: 113,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ShapeButton(
                          icon: Custom.round,
                          isActive: true,
                        ),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                        ShapeButton(icon: Custom.pear),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Header2(title:"Color",value:"F"),
                  Container(
                    height: 83,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ButtonType1(
                          title: "D",
                          isActive: true,
                        ),
                        ButtonType1(title: "E"),
                        ButtonType1(title: "F"),
                        ButtonType1(title: "G"),
                        ButtonType1(title: "H"),
                        ButtonType1(title: "I"),
                        ButtonType1(title: "J"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Header2(title:"Clarity",value:"IF"),
                  Container(
                    height: 83,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ButtonType1(
                          title: "IF",
                          isActive: true,
                        ),
                        ButtonType1(title: "VVS1"),
                        ButtonType1(title: "VVS2"),
                        ButtonType1(title: "VS1"),
                        ButtonType1(title: "VS2"),
                        ButtonType1(title: "SI1"),
                        ButtonType1(title: "SI2"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Row(children: <Widget>[
//              Expanded(child: RaisedButton(child: Text("Search"),),),
//              SizedBox(width: 16,),
              Expanded(child: RaisedButton(child: Text("Calculate"),onPressed: (){},),)
            ],),
          )
        ],
      ),

    );
  }
}

class Header2 extends StatelessWidget {
  final String title;
  final String value;
  const Header2({
    Key key, this.title, this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "$title : "),
            TextSpan(
                text: value,
                style: TextStyle(fontWeight: FontWeight.w800))
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

  const ButtonType1({
    Key key,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
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
      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 26),


        child:Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800),),


    );
  }
}

class ShapeButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const ShapeButton({
    Key key,
    this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
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
      padding: EdgeInsets.all(10),
      child: IconButton(
        iconSize: 46,
        icon: Icon(
          icon,
        ),
        onPressed: () {},
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
                        price.toString(),
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

  const PriceField2({
    Key key,
    this.title,
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
                gradient: LinearGradient(colors: [
                  kPrimaryDarkColor3,
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        keyboardType: TextInputType.number,
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
