import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/text_style.dart';
import 'package:igli_financial/view/more/myprofile.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  String? phone;
  String? emailId;
  String? verificationId;
  bool? isEmail;

  VerificationScreen(
      {Key? key, this.phone, this.verificationId, this.isEmail, this.emailId})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController phoneSmsCode = TextEditingController();
  TextEditingController emailSmsCode = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String otp = '';
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: colorPrimary),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Verification Code",
                  style: themeData.textTheme.subtitle1
                      ?.copyWith(color: colors000000, fontSize: 20))
              .paddingOnly(top: 100),
          const Text("We have send the code verification to")
              .paddingOnly(top: 20, bottom: 2),
          Text(
            widget.isEmail == true ? "${widget.emailId}" : "${widget.phone}.",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ).paddingOnly(bottom: 20, top: 20),
          Center(
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              validator: (s) {},
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: (value) {
                otp = value;
              },
            ).paddingOnly(bottom: 50, top: 50),
          ),
          Row(
            children: [
              Expanded(
                  child: commonElevatedButton(
                      title: "Resend", horizontalPadding: 20)),
              Expanded(
                  child: commonElevatedButton(
                      onTap: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.verificationId ?? "",
                                  smsCode: otp);

                          await _auth.signInWithCredential(credential);
                          Get.back();
                        } catch (e) {
                          showFlash(
                            context: context,
                            duration: Duration(seconds: 2),
                            builder: (context, controller) {
                              return FlashBar(content: Text("Wrong OTP"));
                            },
                          );
                        }
                      },
                      title: "confirm",
                      horizontalPadding: 20)),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
