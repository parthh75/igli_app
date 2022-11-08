import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/main_screen.dart';

import '../utilities/colors.dart';
import '../utilities/common_button.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/string.dart';
import '../utilities/text_style.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = "parth@dwarkeshgroup.com";
    password.text = "123456";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset(
                        "assets/image/close_circle.png",
                        scale: 3.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  CS.welcome,
                  style: themeData.textTheme.headline1?.copyWith(color: colors000000),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Text(
                  CS.letsLoginForExplore,
                  style: themeData.textTheme.subtitle1?.copyWith(color: textColorPrimary),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Text(
                  CS.emailAdd,
                  style: themeData.textTheme.subtitle1?.copyWith(color: colors000000),
                ),
                CommonTextField(
                  textEditingController: emailController,
                  hintText: "Enter email",
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
                  underlineInputBorder: const UnderlineInputBorder(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  CS.password,
                  style: themeData.textTheme.subtitle1?.copyWith(color: colors000000),
                ),
                CommonTextField(
                    textEditingController: password,
                    hintText: "Enter password",
                    isPassword: true,
                    preFixIcon: Image.asset(
                      "assets/image/keyboard.png",
                      scale: 3.5,
                    ),
                    underlineInputBorder: const UnderlineInputBorder(),
                    validationFunction: (String value) {
                      if (value.isEmpty) {
                        return "Password can't be empty";
                      }
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*Obx(() {
                      return GetCheckBoxRow(
                          text: CS.rememberMe,
                          value:
                              AuthenticationController.it.isRememberMeSelected);
                    }),*/
                    const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ForgotPassword());
                      },
                      child: Text(
                        CS.forgotPasswordq,
                        style: themeData.textTheme.subtitle1?.copyWith(color: textColorPrimary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                GetButton(
                  ontap: () {
                    Get.offAll(const MainScreen());
                  },
                  text: CS.signIn,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0),
                      child: Text(
                        CS.connectWith,
                        style: themeData.textTheme.subtitle2?.copyWith(color: textColorPrimary),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 54.0),
                  child: Row(
                    mainAxisAlignment: Platform.isIOS ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/image/google_circle.png",
                          scale: 3.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/image/facebook_circle.png",
                          scale: 3.5,
                        ),
                      ),
                      if (Platform.isIOS)
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/image/apple_circle.png",
                            scale: 3.5,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(() => SignUpScreen());
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: CS.youDonHaveAccount,
                        style: themeData.textTheme.subtitle1?.copyWith(color: textColorPrimary),
                      ),
                      TextSpan(text: CS.register, style: themeData.textTheme.subtitle1?.copyWith(color: colors000000)),
                    ])),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ));
  }

// Future<bool> validateLogin() async {
//   if (await AuthenticationController.it
//       .login(email: emailController.text, password: password.text)) {
//     return true;
//   } else {
//     return false;
//   }
// AuthenticationController.it.login(email: emailController.text, password: password.text).then((value) {
//   return value;
// });
// return false;
// }
}
