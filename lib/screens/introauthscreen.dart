import 'package:boom/authentication/navigateauthscreen.dart';
import 'package:boom/variables.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Welcome",
            body: "Welcome to BOOM, the best video conference app",
            image: Center(
              child: Image.asset("images/welcome.png"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Join or start meetings",
            body:
                "Easy to use interface, join or start meetings in a fast time",
            image: Center(
              child: Image.asset("images/conference.png"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Security",
            body: "Your security is important for us.Our servers are secure",
            image: Center(
              child: Image.asset("images/secure.jpg"),
              heightFactor: 175,
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: () {
        print("skipped");
      },
      showSkipButton: true,
      showDoneButton: true,
      skip: const Icon(
        Icons.skip_next,
        size: 45,
      ),
      next: const Icon(Icons.arrow_forward),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
