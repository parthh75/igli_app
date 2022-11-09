import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/string.dart';

import '../utilities/colors.dart';
import '../utilities/common_button.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colorPrimary.withOpacity(0.2)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "${CS.needHelp}?",
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("Fill up the form below to reach out to us, or \nconnect with us at"),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: colorPrimary,
                            ).paddingOnly(right: 5),
                            Text(
                              CS.dEmail,
                              style: TextStyle(color: colorPrimary),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(CS.weWillBeHappyToAssistYou),
                    ),
                  ],
                ),
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
              decoration: InputDecoration(hintText: CS.typeYourMessageHere, border: const OutlineInputBorder(), hintStyle: const TextStyle(color: Colors.grey)),
            ),
            GetButton(ontap: () {}, text: "Save").paddingOnly(top: 25)
          ],
        ),
      ),
    );
  }
}
