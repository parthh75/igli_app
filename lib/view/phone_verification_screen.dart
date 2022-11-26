import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/more/myprofile.dart';

class VerificationScreen extends StatefulWidget {
  String? phone;
  String? emailId;
  String? code;
  bool? isEmail;

  VerificationScreen(
      {Key? key, this.phone, this.code, this.isEmail, this.emailId})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController phoneSmsCode = TextEditingController();
  TextEditingController emailSmsCode = TextEditingController();
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

  Future<void> velidation() async {
    await emailAuth.validateOtp(
        recipientMail: widget.emailId ?? "", userOtp: emailSmsCode.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Verification Code",
              style: themeData.textTheme.subtitle1
                  ?.copyWith(color: colors000000))
              .paddingOnly(top: 20),
          const Text("We have send the code verification to")
              .paddingOnly(top: 20, bottom: 2),
          Text(
            widget.isEmail == true ? "${widget.emailId}" : "${widget.phone}.",
            style: const TextStyle(color: Colors.black),
          ).paddingOnly(bottom: 20),
          widget.isEmail == true
              ? TextField(
            controller: emailSmsCode,
            onSubmitted: (value) {},
          )
              : TextField(
            controller: phoneSmsCode,
            onSubmitted: (otp) {
              FirebaseAuth.instance
                  .signInWithCredential(PhoneAuthProvider.credential(
                  verificationId: widget.code ?? "", smsCode: otp))
                  .then((value) {});
            },
          ).paddingOnly(bottom: 150),

          Row(
            children: [
              Expanded(
                  child: commonElevatedButton(
                      title: "Resend", horizontalPadding: 20)),
              Expanded(
                  child: commonElevatedButton(
                      title: "confirm", horizontalPadding: 20)),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
