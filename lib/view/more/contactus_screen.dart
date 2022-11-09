import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/more/myprofile.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CS.contactUs),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: color26569a.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "${CS.needHelp}?",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ).paddingOnly(left: 10),
                  const Text(
                          "Fill up the form below to reach out to us, or \nconnect with us at")
                      .paddingSymmetric(vertical: 10)
                      .paddingOnly(left: 10),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: color26569a,
                            size: 18,
                          ).paddingOnly(right: 5),
                          Text(
                            CS.dEmail,
                            style: TextStyle(color: color26569a),
                          ),
                        ],
                      )),
                  Text(CS.weWillBeHappyToAssistYou)
                      .paddingOnly(left: 10, top: 10),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${CS.selectEntity}*"),
            const TextField(),
            const SizedBox(
              height: 30,
            ),
            Text(CS.whatIsTheQueryAbout),
            const TextField(),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: CS.typeYourMessageHere,
                  border: const OutlineInputBorder(),
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
            commonElevatedButton(
                onTap: () {},
                title: CS.save,
                height: 50,
                buttonColor: color26569a,
                buttonTopPadding: 50,
                horizontalPadding: 0)
          ],
        ),
      ),
    );
  }
}
