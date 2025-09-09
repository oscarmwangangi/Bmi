import 'package:flutter/material.dart';
import '../calculate_brain.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}


enum Gender {
  male,
  female
}

int height = 180;
int weight = 60;
int age = 20;

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
                  Expanded(child: ReusableCard(
                    color: const Color(kExpandedWidgetColor),
                   cardChild: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Weight', style: kLableTextStyle),
                       Text(weight.toString(),style: kNumberTextStyle,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                             onpressed: (){
                               setState(() {
                                 weight --;

                               });
                             },

                           ),
                           SizedBox(width: 10.0,),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onpressed: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           ),

    ]

                       )

                     ],
                   ),
                  )),
                  Expanded(
                      child: ReusableCard(
                        color: const Color(kExpandedWidgetColor),
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Age', style: kLableTextStyle),
                            Text(age.toString(),style: kNumberTextStyle,),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onpressed: (){
                                      setState(() {
                                        age --;

                                      });
                                    },

                                  ),
                                  SizedBox(width: 10.0,),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onpressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),

                                ]

                            )

                          ],
                        ),
                      )
                      ),
                ]
            )
            ),
            BottonButton(onTap: () {
              calculatorBMI calc = calculatorBMI(height: height,weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  ResultInterpretation: calc.getInterpretation(),
                  ResultText: calc.getResult(),
                  BmiResult: calc.CalculateBMI(),
                )),

              );
            }, bottomTitle: 'CALCULATE',)
          ],
        )
    );
  }
}



class RoundIconButton extends StatelessWidget {

  // const ({super.key});
  RoundIconButton({this.icon, required this.onpressed});

  final IconData? icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
    onPressed: onpressed,
    constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),

    elevation: 6.0,
    shape: const CircleBorder(),
  fillColor: Color(0xFF4C4F5E),
    );
  }
}
