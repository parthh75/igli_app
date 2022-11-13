import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/help_screen.dart';
import 'package:igli_financial/view/more/myprofile.dart';
import 'package:igli_financial/view/more/partners_screen.dart';

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
            commonListTile(title: "Services", leadingIcon: Icons.paste,,onTap: (){Get.to(AllServices());}),
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
                  Get.to(Help());
                }),
            commonListTile(
                title: CS.contactUs,
                leadingIcon: Icons.mail_outline,
                onTap: () {
                  Get.to(ContactUs());
                }),
            // commonListTile(
            //     title: "Read Articles", leadingIcon: Icons.file_copy_outlined),
            commonListTile(
                title: "Legal & Terms", leadingIcon: Icons.filter_1_rounded),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              title: const Text("Sign Out"),
              leading: const Icon(Icons.output, color: Colors.red, size: 20),
              horizontalTitleGap: -5,
              tileColor: Colors.white,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
