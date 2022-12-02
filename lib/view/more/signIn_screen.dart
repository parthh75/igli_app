import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/common_button.dart';
import 'package:igli_financial/utilities/common_taxfield.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/login_screen.dart';
import 'package:igli_financial/view/main_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);
  String verifiy = '';

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
  TextEditingController cPasswordController = TextEditingController();
  bool success = false;
  bool isVerification = false;
  String userEmail = "";
  String phoneNumber = "";
  bool isFirstError = false;
  bool isLastError = false;
  bool isPhoneNumber = false;
  bool isEmailNumber = false;
  bool isPassword = false;
  bool isCPassword = false;
  bool isCheckPassword = false;
  bool isAlreadyLogin = false;

  // final User? user = (await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text))
  //     .user;

  SignUp() async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      User? user = result.user;

      if (user != null) {
        setState(() {
          success = true;
          userEmail = user.email!;
        });
      } else {
        success = false;
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          isAlreadyLogin = true;
        });
        print('The account already exists for that email.');
      } else if (e.code == 'operation-not-allowed') {
        print('There is a problem with auth service config :/');
      } else if (e.code == 'weak-password') {
        print('Please type stronger password');
      } else {
        print('auth error ' + e.toString());
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                )).paddingOnly(left: 8),
            Column(
              children: [
                commonTextFormField(
                  onTapFunction: () {
                    setState(() {
                      isFirstError = false;
                    });
                  },
                  textEditingController: firstNameController,
                  hintText: "Enter First Name",
                  headText: CS.firstName,
                  textFieldHeight: 80,
                  errorText: isFirstError ? "Enter First Name" : "",
                  validationFunction: (String value) {
                    if (value.isEmpty) {
                      return "First Name can't be empty";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Enter valid First Name!";
                    }
                  },
                ).paddingOnly(top: 20),
                commonTextFormField(
                  onTapFunction: () {
                    setState(() {
                      isLastError = false;
                    });
                  },
                  textEditingController: lastNameController,
                  hintText: "Enter Last Name",
                  headText: CS.lastName,
                  textFieldHeight: 80,
                  errorText: isLastError ? "Enter Last Name" : "",
                  validationFunction: (String value) {
                    if (value.isEmpty) {
                      return "Last Name can't be empty";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Enter valid Last Name!";
                    }
                  },
                ),
                commonTextFormField(
                  onTapFunction: () {
                    setState(() {
                      isPhoneNumber = false;
                    });
                  },
                  onChangedFunction: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                  textEditingController: phoneController,
                  hintText: "Enter Phone Number",
                  headText: CS.phoneNumber,
                  keyboardType: TextInputType.phone,
                  textFieldHeight: 80,
                  errorText: isPhoneNumber ? "Enter Phone Number" : "",
                  preFixIcon: Icon(
                    Icons.phone,
                    color: colors000000,
                  ),
                  suffixIcon: InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91 ${phoneController.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        timeout: const Duration(seconds: 60),
                        codeSent:
                            (String verificationId, int? resendToken) async {
                          final result = await Get.to(VerificationScreen(
                            phone: phoneNumber,
                            verificationId: verificationId,
                          ));
                          if (result != null) {
                            setState(() {
                              isVerification = true;
                            });
                          }
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child: isVerification
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Text("Verifiy",
                                style: TextStyle(color: Colors.red))
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
                commonTextFormField(
                  onTapFunction: () {
                    setState(() {
                      isEmailNumber = false;
                    });
                  },
                  textEditingController: emailController,
                  hintText: "Enter email",
                  errorText: isEmailNumber ? "Enter email" : "",
                  headText: CS.emailAdd,
                  textFieldHeight: 80,
                  keyboardType: TextInputType.emailAddress,
                  preFixIcon: Image.asset(
                    "assets/image/mail.png",
                    scale: 3.5,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      Get.to(VerificationScreen(
                        isEmail: true,
                        emailId: emailController.text,
                      ));
                    },
                    child: const Text("Verifiy",
                            style: TextStyle(color: Colors.red))
                        .paddingOnly(top: 10, right: 10),
                  ),
                  validationFunction: (String value) {
                    if (value.isEmpty) {
                      return "Email can't be empty";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Enter valid email address!";
                    }
                  },
                ),
                commonTextFormField(
                    onTapFunction: () {
                      setState(() {
                        isPassword = false;
                      });
                    },
                    textEditingController: passwordController,
                    hintText: "Enter password",
                    errorText: isPassword ? "Enter password" : "",
                    isPassword: true,
                    textStyle: themeData.textTheme.subtitle1
                        ?.copyWith(color: colors000000),
                    headText: CS.password,
                    textFieldHeight: 80,
                    preFixIcon: Icon(
                      Icons.key,
                      color: colors000000,
                    ),
                    validationFunction: (String value) {
                      if (value.isEmpty) {
                        return const Text("Password can't be empty");
                      }
                    }),
                commonTextFormField(
                    onTapFunction: () {
                      setState(() {
                        isCPassword = false;
                        isCheckPassword = false;
                      });
                    },
                    textEditingController: cPasswordController,
                    hintText: "Enter Confirm password",
                    errorText: isCPassword
                        ? "Enter Confirm password"
                        : isCheckPassword
                            ? "Password is not Match"
                            : "",
                    isPassword: true,
                    textStyle: themeData.textTheme.subtitle1
                        ?.copyWith(color: colors000000),
                    headText: CS.confirmPassword,
                    textFieldHeight: 80,
                    preFixIcon: Icon(
                      Icons.key,
                      color: colors000000,
                    ),
                    onSavedFunction: () {
                      if (passwordController.text ==
                          cPasswordController.text) {}
                    },
                    validationFunction: (String value) {
                      if (passwordController.text != cPasswordController.text) {
                        setState(() {
                          isCPassword = true;
                        });
                      }

                      if (value.isEmpty) {
                        return "Confirm Password can't be empty";
                      }
                    }),
                GetButton(
                  ontap: () {
                    SignUp();
                    if (firstNameController.text.isEmpty) {
                      setState(() {
                        isFirstError = true;
                      });
                    }
                    if (lastNameController.text.isEmpty) {
                      setState(() {
                        isLastError = true;
                      });
                    }
                    if (phoneController.text.isEmpty) {
                      setState(() {
                        isPhoneNumber = true;
                      });
                    }
                    if (emailController.text.isEmpty) {
                      setState(() {
                        isEmailNumber = true;
                      });
                    }
                    if (passwordController.text.isEmpty) {
                      setState(() {
                        isPassword = true;
                      });
                    }
                    if (cPasswordController.text.isEmpty) {
                      setState(() {
                        isCPassword = true;
                      });
                    }

                    if (passwordController.text != cPasswordController.text) {
                      setState(() {
                        isCheckPassword = true;
                      });
                    }
                    if (isFirstError == true ||
                        isLastError == true ||
                        isPhoneNumber == true ||
                        isEmailNumber == true ||
                        isPassword == true ||
                        isCPassword == true ||
                        isCheckPassword == true ||
                        isAlreadyLogin == true) {
                      if (isAlreadyLogin == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                              'The account already exists for that email'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                      }
                    } else {
                      isAlreadyLogin ? Get.to(const LoginScreen()) : null;
                    }
                  },
                  text: CS.signIn,
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
          ],
        ),
      ),
    );
  }
}
