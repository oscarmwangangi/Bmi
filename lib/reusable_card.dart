import 'package:flutter/material.dart';

import 'input_data.dart';

class ReusableCard extends StatelessWidget {


  final Color color; // property to pass in
  final Widget? cardChild ;
  final VoidCallback? onPress;


  const ReusableCard({
    Key? key,
    required this.color, // mark as required
    this.cardChild,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(

      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: Color(expandedWidgetColor),
      ),

    ));

  }
}
