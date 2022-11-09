import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';
import '../utilities/common_button.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/string.dart';
import '../utilities/text_style.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: Image.asset(
                      "assets/image/back.png",
                      scale: 3.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  CS.forgotPassword,
                  style: themeData.textTheme.headline1?.copyWith(color: colors000000),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  CS.pleaseEnterYour,
                  style: themeData.textTheme.subtitle2?.copyWith(color: textColorPrimary),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                commonTextFormField(
                  validationFunction: (String value) {
                    if (value.isEmpty) {
                      return "Email can't be empty";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Enter valid email address!";
                    }
                  },
                  textEditingController: controller,
                  hintText: "Enter email",
                  headText: CS.emailAdd,
                  preFixIcon: Image.asset(
                    "assets/image/mail.png",
                    scale: 3.5,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GetButton(
                  ontap: () {},
                  text: CS.next,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: CS.rememberPasswordq,
                          style: themeData.textTheme.subtitle1?.copyWith(color: textColorPrimary),
                        ),
                        TextSpan(text: CS.login, style: themeData.textTheme.subtitle1?.copyWith(color: colors000000)),
                      ]),
                    ),
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
}
