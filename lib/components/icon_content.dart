import 'package:flutter/material.dart';
import '../constants.dart';


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
          size:40.0,
        ),

        SizedBox(height: 15.0),
        Text(lable ,
            style:kLableTextStyle )
      ],
    );
  }
}

