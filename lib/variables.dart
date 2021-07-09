import 'package:boom/components/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle mystyle(double size,
    [Color? color, FontWeight fw = FontWeight.w700]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

List<Color> kPinkGradient = [
  Color.fromRGBO(240, 19, 77, 1),
  Color.fromRGBO(228, 0, 124, 1)
];

List<Color> kGreenGradient = [
  Color(0xFF11998e),
  Color(0xFF38ef7d),
];

CustomTextField kUsernameField(TextEditingController controller) {
  return CustomTextField(
    controller: controller,
    icon: Icons.person,
    keyboardType: TextInputType.text,
    hintText: "Username",
  );
}

CustomTextField kEmailField(TextEditingController controller) {
  return CustomTextField(
    controller: controller,
    icon: Icons.email,
    keyboardType: TextInputType.emailAddress,
    hintText: "Email",
  );
}

CustomTextField kPasswordField(TextEditingController controller) {
  return CustomTextField(
    icon: Icons.lock,
    keyboardType: TextInputType.visiblePassword,
    hintText: "Password",
    controller: controller,
  );
}

CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');

BoxDecoration kEditProfileDecor = BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0xFFEB3349), Color(0xFFF45C43)],
  ),
);
