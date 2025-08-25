import 'package:flutter/material.dart';

const lableTextStyle = TextStyle(fontSize: 80.0, color: Color(0xFF8D8E98));

class iconContent extends StatelessWidget {

  final IconData icon;
  final String lable;

  const iconContent({
    super.key,
    required this.icon,
    required this.lable
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          size:80.0,
        ),

        SizedBox(height: 15.0),
        Text(lable ,
            style:lableTextStyle )
      ],
    );
  }
}

