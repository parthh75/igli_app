import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/common_widgets/done_screen.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/more/instant_loans_screen.dart';
import 'package:igli_financial/view/more/ourpartnerservicescreen.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            color: colorFFFFFF,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  CS.partnerServicesAre,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ).paddingSymmetric(horizontal: 20, vertical: 20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Current State",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      'Gujarat',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_outlined,
                      color: color26569a,
                    ))
              ],
            ),
          ),
          Wrap(
            children: [
              commonPartnersCard(
                title: "Coworking Spaces",
                icon: Icons.person_outline,
                ontap: () {
                  Get.to(OurPartnerServiceScreen(
                    title: "Oyo WorkSpaces",
                    ontap: () {
                      commonSheet(
                        context: context,
                        title: "Significance",
                        headText: "Oyo WorkSpaces",
                        discription:
                            "Rent out premium office spaces folr your business or company at affordable prices.",
                        onTap: () {
                          Get.back();
                          Get.to(const doneScreen());
                        },
                      );
                    },
                  ));
                },
              ).paddingOnly(right: 10, left: 10),
              commonPartnersCard(
                title: "Instant Loans",
                icon: Icons.paste_rounded,
                ontap: () {
                  Get.to(InstantLoansScreen());
                },
              ),
              commonPartnersCard(
                  title: "DIY Website",
                  icon: Icons.web_sharp,
                  ontap: () {
                    Get.to(OurPartnerServiceScreen(
                      title: "Websites.co.in",
                      ontap: () {},
                    ));
                  }).paddingOnly(right: 10, left: 10),
              commonPartnersCard(
                  title: "Payment Gateway",
                  icon: Icons.paypal,
                  ontap: () {
                    Get.to(OurPartnerServiceScreen(
                      title: "Instamojo",
                      ontap: () {
                        commonSheet(
                          context: context,
                          title: "Significance",
                          headText: "Instamojo",
                          discription: "Easiest way to collect your payments.",
                          onTap: () {
                            Get.back();
                            Get.to(const doneScreen());
                          },
                        );
                      },
                    ));
                  }),
            ],
          )
        ],
      ),
    );
  }
}

Widget commonPartnersCard({ontap, icon, title}) {
  return InkWell(
    onTap: ontap,
    child: SizedBox(
      width: 120,
      height: 140,
      child: Card(
        child: Column(
          children: [
            Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: color26569a.withOpacity(0.1)),
                child: Icon(
                  icon,
                  size: 30,
                  color: color26569a,
                )),
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ).paddingOnly(bottom: 10))
          ],
        ),
      ),
    ).paddingOnly(top: 10),
  );
}
