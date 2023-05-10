import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/more/signIn_screen.dart';

import '../utilities/colors.dart';
import '../utilities/common_button.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/string.dart';
import '../utilities/text_style.dart';
import 'forget_password.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxInt success = 1.obs;
  RxBool loading = false.obs;
  String userEmail = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signIn() async {
    loading.value = true;
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      success.value = 2;
      loading.value = false;
      Get.offAll(() => const MainScreen());
    } else {
      success.value = 3;
      loading.value = false;
    }
  }

  @override
  void initState() {
    emailController.text = "parth@dwarkeshgroup.com";
    passwordController.text = "1234567";
    // FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: emailController.text, password: passwordController.text);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: StreamBuilder(
              stream: loading.stream,
              builder: (context, snapshot) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          // shrinkWrap: true,
                          // physics: const ClampingScrollPhysics(),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 100.0,
                            ),
                            Text(
                              CS.welcome,
                              style: themeData.textTheme.headline1
                                  ?.copyWith(color: colors000000),
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              CS.letsLoginForExplore,
                              style: themeData.textTheme.subtitle1
                                  ?.copyWith(color: textColorPrimary),
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
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
                                textStyle: themeData.textTheme.subtitle1
                                    ?.copyWith(color: colors000000),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Obx(() {
                                //   return GetCheckBoxRow(text: CS.rememberMe, value: AuthenticationController.it.isRememberMeSelected);
                                // }),
                                const SizedBox(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const ForgotPassword());
                                  },
                                  child: Text(
                                    CS.forgotPasswordq,
                                    style: themeData.textTheme.subtitle1
                                        ?.copyWith(color: textColorPrimary),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                            GetButton(
                              ontap: () async {
                                await signIn();
                                success.value == 2
                                    ? Get.offAll(() => const MainScreen())
                                    : showFlash(
                                        context: context,
                                        duration: const Duration(seconds: 3),
                                        builder: (context, controller) {
                                          return Flash(
                                            controller: controller,
                                            position: FlashPosition.top,
                                            behavior: FlashBehavior.floating,
                                            boxShadows: kElevationToShadow[4],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            margin: const EdgeInsets.all(20),
                                            backgroundColor: colorPrimary,
                                            horizontalDismissDirection:
                                                HorizontalDismissDirection
                                                    .horizontal,
                                            child: FlashBar(
                                                content: Text(
                                                    'InValid Email Id OR Password',
                                                    style: TextStyle(
                                                        color: colorFFFFFF))),
                                          );
                                        },
                                      );
                              },
                              text: CS.login,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignInScreen());
                              },
                              child: Center(
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: CS.youDonHaveAccount,
                                    style: themeData.textTheme.subtitle1
                                        ?.copyWith(color: textColorPrimary),
                                  ),
                                  TextSpan(
                                      text: CS.register,
                                      style: themeData.textTheme.subtitle1
                                          ?.copyWith(color: colors000000)),
                                ])),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (loading.value)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                );
              })),
    );
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
