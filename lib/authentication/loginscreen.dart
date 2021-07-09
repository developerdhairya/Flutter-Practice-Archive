import 'package:boom/authentication/navigateauthscreen.dart';
import 'package:boom/components/custom_text_field.dart';
import 'package:boom/components/sign_buttons.dart';
import 'package:boom/components/stack_design.dart';
import 'package:boom/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return StackDesign(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          kEmailField(emailController),
          SizedBox(
            height: 20,
          ),
          kPasswordField(passwordController),
          SizedBox(
            height: 40,
          ),
          SignButton(
            onPressed: () async {
              try {
                int count = 0;
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              } on FirebaseAuthException catch (e) {
                print('in catch block');
                print(e.toString());
                var snackBar = SnackBar(
                  content: Text(
                    e.toString(),
                    style: mystyle(20),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            linearGradient: kGreenGradient,
            text: "SIGN IN",
            fontSize: 25.0,
          )
        ],
      ),
    );
  }
}
