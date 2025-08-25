import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
const bottomContainerHeight = 80.0;
const expandedWidgetColor = 0xFF1D1E33;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender){
  if (gender == 1){
    if (maleCardColor == inactiveCardColor){
      maleCardColor = activeCardColor;
      femaleCardColor = inactiveCardColor;
    }else{
      maleCardColor = inactiveCardColor;
    }
    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
        maleCardColor = activeCardColor;
      }
    }}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(1);
                        });
                      },


                    child: ReusableCard(color: inactiveCardColor,
                cardChild: iconContent(
                  icon: FontAwesomeIcons.mars,
                  lable: 'Male',
                ),),),),
                Expanded(

                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(color: inactiveCardColor,
                                        cardChild: iconContent(
                      icon: FontAwesomeIcons.venus,
                      lable: 'Female',
                                        ),),
                    ))
              ],
            )
            ),
            Expanded(child: ReusableCard(color: const Color(expandedWidgetColor),)),
            Expanded(child:Row(
                children: [
                  Expanded(child: ReusableCard(color: const Color(expandedWidgetColor))),
                  Expanded(child: ReusableCard(color: const Color(expandedWidgetColor))),
                ]
            )
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        )
    );
  }
}

