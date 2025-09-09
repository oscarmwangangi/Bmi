import 'package:flutter/material.dart';
import '../constants.dart';

class BottonButton extends StatelessWidget {

  const BottonButton({
    required this.onTap, required this.bottomTitle,
  });

  final VoidCallback onTap;
  final String bottomTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(top:20),
        child: Center(
            child: Text(bottomTitle)
        ),
      ),
    );
  }
}