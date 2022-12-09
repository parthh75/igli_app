import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/login_screen.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/help_screen.dart';
import 'package:igli_financial/view/more/myprofile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utilities/colors.dart';
import 'contactus_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(CS.myProfile),
              trailing: const Icon(Icons.navigate_next),
              leading: Icon(Icons.account_circle_rounded,
                  color: colorPrimary, size: 22),
              horizontalTitleGap: -5,
              tileColor: Colors.white,
              onTap: () {
                Get.to(const ProfileScreen());
              },
            ),
            Text(
              CS.ourServices,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ).paddingOnly(top: 15, bottom: 15, left: 20),
            commonListTile(
                title: "Services",
                leadingIcon: Icons.paste,
                onTap: () {
                  Get.to(AllServices());
                }),
            // commonListTile(
            //     onTap: () {
            //       Get.to(const PartnersScreen());
            //     },
            //     title: "Partners",
            //     leadingIcon: Icons.person_outline),
            commonListTile(
                title: "My Interests", leadingIcon: Icons.currency_rupee),
            Text(
              CS.support,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ).paddingOnly(top: 15, bottom: 15, left: 20),
            commonListTile(
                title: "Help",
                leadingIcon: Icons.help_outline,
                onTap: () {
                  Get.to(const Help());
                }),
            commonListTile(
                title: CS.contactUs,
                leadingIcon: Icons.mail_outline,
                onTap: () {
                  Get.to(const ContactUs());
                }),
            // commonListTile(
            //     title: "Read Articles", leadingIcon: Icons.file_copy_outlined),
            commonListTile(
                onTap: _launchURLApp,
                title: "Legal & Terms",
                leadingIcon: Icons.filter_1_rounded),

            const SizedBox(
              height: 50,
            ),
            ListTile(
              title: const Text("logOut"),
              leading: const Icon(Icons.output, color: Colors.red, size: 20),
              horizontalTitleGap: -5,
              tileColor: Colors.white,
              onTap: () {
                showModalBottomSheet(
                  constraints: const BoxConstraints(maxHeight: 300),
                  shape: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          height: 5,
                          width: Get.width / 5,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const Icon(
                          Icons.delete_outline,
                          size: 80,
                          color: Colors.red,
                        ).paddingOnly(top: 20, bottom: 20),
                        const Text(
                          "Are you sure you wish to logout?",
                          style: TextStyle(fontSize: 22),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: commonElevatedButton(
                                  height: 40,
                                  title: CS.no,
                                  onTap: () {
                                    Get.back();
                                  },
                                  buttonColor: colorBEC3C8,
                                  horizontalPadding: 30),
                            ),
                            Expanded(
                              child: commonElevatedButton(
                                  height: 40,
                                  title: CS.yes,
                                  onTap: () {
                                    try {
                                      FirebaseAuth.instance.signOut().then(
                                          (value) =>
                                              Get.offAll(const LoginScreen()));
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  buttonColor: colorPrimary,
                                  horizontalPadding: 30),
                            ),
                          ],
                        ).paddingOnly(bottom: 50)
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

_launchURLApp() async {
  var url = Uri.parse("https://iglifinancial.com/terms-and-condition/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
