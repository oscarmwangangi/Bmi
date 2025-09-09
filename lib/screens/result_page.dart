import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import 'input_data.dart';
import '../calculate_brain.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.BmiResult, required this.ResultInterpretation, required this.ResultText});

  final String BmiResult;
  final String ResultText;
  final String ResultInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
         Expanded(child: Container(
           padding: EdgeInsets.all(15),
           alignment: Alignment.bottomLeft,
           child: Text('Your result',style: kTitleTextStyle,),

         )),
          Expanded(
              flex: 5,
              child: ReusableCard(color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(ResultText.toUpperCase(),
                      style: kResultTextStyle,),
                    Text(BmiResult,
                    style: kBmiTextStyle,),
                    Text(ResultInterpretation,style: kBodyTextStyle,)


                  ],
                ),

              ),
          ),
          BottonButton(onTap: () {
            Navigator.pop(
              context,
            );
          }, bottomTitle: 'RE-CALCULATE',)
        ],
      )
    );
  }
}
