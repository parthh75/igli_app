import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/common_button.dart';
import 'package:igli_financial/utilities/common_taxfield.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/main_screen.dart';
import 'package:igli_financial/view/phone_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController CpasswordController = TextEditingController();
  bool success = false;
  String userEmail = "";
  String? _code;

  void registration() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        success = true;
        userEmail = user.email!;
        getStorage.write('login', "true");
      });
    } else {
      success = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          commonTextFormField(
            textEditingController: firstNameController,
            hintText: "Enter First Name",
            headText: CS.firstName,
            textFieldHeight: 50,
            validationFunction: (String value) {
              if (value.isEmpty) {
                return "First Name can't be empty";
              } else if (!GetUtils.isEmail(value)) {
                return "Enter valid First Name!";
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          commonTextFormField(
            textEditingController: lastNameController,
            hintText: "Enter Last Name",
            headText: CS.lastName,
            textFieldHeight: 50,
            validationFunction: (String value) {
              if (value.isEmpty) {
                return "Last Name can't be empty";
              } else if (!GetUtils.isEmail(value)) {
                return "Enter valid Last Name!";
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          commonTextFormField(
            textEditingController: phoneController,
            hintText: "Enter Phone Number",
            headText: CS.phoneNumber,
            keyboardType: TextInputType.phone,
            textFieldHeight: 50,
            preFixIcon: Icon(
              Icons.phone,
              color: colors000000,
            ),
            suffixIcon: InkWell(
              onTap: () {
                _auth.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    verificationCompleted: (PhoneAuthCredential credential) {
                      FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) {
                        print("done");
                      });
                      Get.to(PhoneVerificationScreen(
                        phone: phoneController.text,
                        code: _code,
                      ));
                    },
                    verificationFailed: (value) {},
                    timeout: Duration(seconds: 60),
                    codeSent: (String code, int? smscode) {
                      setState(() {
                        _code = code;
                      });
                    },
                    codeAutoRetrievalTimeout: (String value) {
                      setState(() {
                        _code = value;
                      });
                    });
              },
              child: Text("Verifiy", style: TextStyle(color: Colors.red))
                  .paddingOnly(top: 10, right: 10),
            ),
            validationFunction: (String value) {
              if (value.isEmpty) {
                return "Phone Number can't be empty";
              } else if (!GetUtils.isEmail(value)) {
                return "Enter valid Phone Number!";
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          commonTextFormField(
            textEditingController: emailController,
            hintText: "Enter email",
            headText: CS.emailAdd,
            textFieldHeight: 50,
            keyboardType: TextInputType.emailAddress,
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
              preFixIcon: Icon(
                Icons.key,
                color: colors000000,
              ),
              validationFunction: (String value) {
                if (value.isEmpty) {
                  return "Password can't be empty";
                }
              }),
          const SizedBox(
            height: 20.0,
          ),
          commonTextFormField(
              textEditingController: CpasswordController,
              hintText: "Enter Confirm password",
              isPassword: true,
              textStyle:
              themeData.textTheme.subtitle1?.copyWith(color: colors000000),
              headText: CS.confirmPassword,
              textFieldHeight: 50,
              preFixIcon: Icon(
                Icons.key,
                color: colors000000,
              ),
              onSavedFunction: () {
                if (passwordController.text == CpasswordController.text) {}
              },
              validationFunction: (String value) {
                if (passwordController.text != CpasswordController.text) {
                  return "Password is not Match";
                }

                if (value.isEmpty) {
                  return "Confirm Password can't be empty";
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
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
