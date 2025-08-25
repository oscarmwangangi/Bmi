import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {


  final Color color; // property to pass in
  final Widget cardChild;

  const ReusableCard({
    Key? key,
    required this.color, // mark as required
    required this.cardChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: Color(expandedWidgetColor),
      ),
    );
  }
}
