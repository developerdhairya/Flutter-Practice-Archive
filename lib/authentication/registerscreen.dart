import 'package:boom/authentication/navigateauthscreen.dart';
import 'package:boom/components/custom_text_field.dart';
import 'package:boom/components/sign_buttons.dart';
import 'package:boom/components/stack_design.dart';
import 'package:boom/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StackDesign(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          kUsernameField(usernameController),
          SizedBox(
            height: 10,
          ),
          kEmailField(emailController),
          SizedBox(
            height: 10,
          ),
          kPasswordField(passwordController),
          SizedBox(
            height: 40,
          ),
          SignButton(
            onPressed: () async {
              try {
                int count = 0;
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text)
                    .then((signedUser) {
                  userCollection.doc(signedUser.user!.uid).set({
                    'Username': usernameController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                    'uid': signedUser.user!.uid,
                  });
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                });
              } catch (e) {
                var snackBar = SnackBar(
                  content: Text(
                    e.toString(),
                    style: mystyle(20),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                print(e);
              }
            },
            linearGradient: kPinkGradient,
            text: "SIGNUP",
            fontSize: 25,
          ),
        ],
      ),
    );
  }
}
