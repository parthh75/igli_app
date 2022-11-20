import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/more/myprofile.dart';

class PhoneVerificationScreen extends StatefulWidget {
  String? phone;
  String? code;

  PhoneVerificationScreen({Key? key, this.phone, this.code}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  TextEditingController smsCode = TextEditingController();

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
          Text("We have send the code verification to")
              .paddingOnly(top: 20, bottom: 2),
          Text(
            "${widget.phone}.",
            style: TextStyle(color: Colors.black),
          ).paddingOnly(bottom: 20),
          TextField(
            controller: smsCode,
            onSubmitted: (otp) {
              FirebaseAuth.instance
                  .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: widget.code ?? "", smsCode: otp))
                  .then((value) {});
            },
          ).paddingOnly(bottom: 40),
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
