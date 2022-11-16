import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/common_button.dart';
import 'package:igli_financial/utilities/common_taxfield.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool success = false;
  String userEmail = "";

  void registration() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      setState(() {
        success = true;
        userEmail = user.email!;
      });
    } else {
      success = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          commonTextFormField(
            textEditingController: emailController,
            hintText: "Enter email",
            headText: CS.emailAdd,
            textFieldHeight: 50,
            preFixIcon: Image.asset(
              "assets/image/mail.png",
              scale: 3.5,
            ),
            validationFunction: (String value) {
              if (value.isEmpty) {
                return "Email can't be empty";
              } else if (!GetUtils.isEmail(value)) {
                return "Enter valid email address!";
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          commonTextFormField(
              textEditingController: passwordController,
              hintText: "Enter password",
              isPassword: true,
              textStyle:
                  themeData.textTheme.subtitle1?.copyWith(color: colors000000),
              headText: CS.password,
              textFieldHeight: 50,
              preFixIcon: Image.asset(
                "assets/image/keyboard.png",
                scale: 3.5,
              ),
              validationFunction: (String value) {
                if (value.isEmpty) {
                  return "Password can't be empty";
                }
              }),
          const SizedBox(
            height: 20.0,
          ),
          GetButton(
            ontap: () {
              registration();
            },
            text: CS.signIn,
          ),
        ],
      ),
    );
  }
}
