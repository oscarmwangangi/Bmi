import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}


enum Gender {
  male,
  female
}

int height = 180;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                  child: ReusableCard(color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      lable: 'Male',
                    ), onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },),),
                Expanded(
                  child: ReusableCard(color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
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
            Expanded(child: ReusableCard(color: const Color(kExpandedWidgetColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: kLableTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [

                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kLableTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider
                      (value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                        setState(() {
                          height = newValue.toInt();
                        });
                    }),
                  )
                ],
                
              ),

            )),
            Expanded(child:Row(
                children: [
                  Expanded(child: ReusableCard(color: const Color(kExpandedWidgetColor))),
                  Expanded(child: ReusableCard(color: const Color(kExpandedWidgetColor))),
                ]
            )
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        )
    );
  }
}