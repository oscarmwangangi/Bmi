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

enum Gender {
  male,
  female
}
class _InputPageState extends State<InputPage> {

   Gender? selectedGender;

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
                  child: ReusableCard(color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      lable: 'Male',
                    ), onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },),),
                Expanded(
                  child: ReusableCard(color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.venus,
                      lable: 'Female',
                    ), onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },),
                )
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