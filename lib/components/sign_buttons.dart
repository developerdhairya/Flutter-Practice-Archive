import 'package:boom/authentication/registerscreen.dart';
import 'package:flutter/material.dart';

import '../variables.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    Key? key,
    required this.linearGradient,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  final linearGradient;
  final String text;
  final Function onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: linearGradient,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: mystyle(
              fontSize,
              Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
