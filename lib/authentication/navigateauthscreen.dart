import 'package:boom/authentication/loginscreen.dart';
import 'package:boom/authentication/registerscreen.dart';
import 'package:boom/components/sign_buttons.dart';
import 'package:boom/components/stack_design.dart';
import 'package:boom/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StackDesign(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          fontSize: 30.0,
          linearGradient: kGreenGradient,
          text: "SIGN IN",
        ),
        SizedBox(
          height: 40,
        ),
        SignButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            );
          },
          linearGradient: kPinkGradient,
          text: "SIGN UP",
          fontSize: 30.0,
        ),
      ],
    ));
  }
}
