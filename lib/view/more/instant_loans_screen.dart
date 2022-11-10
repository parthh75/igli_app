import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/common_widgets/done_screen.dart';
import 'package:igli_financial/view/more/more_main.dart';
import 'package:igli_financial/view/more/ourpartnerservicescreen.dart';

class InstantLoansScreen extends StatefulWidget {
  const InstantLoansScreen({Key? key}) : super(key: key);

  @override
  State<InstantLoansScreen> createState() => _InstantLoansScreenState();
}

class _InstantLoansScreenState extends State<InstantLoansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instant Loans")),
      body: Column(
        children: [
          commonListTile(
              title: "MoneyTap",
              onTap: () {},
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))
              .paddingOnly(top: 10, left: 20, right: 20),
          commonListTile(
              title: "LendingKart",
              onTap: () {
                commonSheet(
                    context: context,
                    title: "Significance",
                    headText: "LendingKart",
                    discription:
                    "Take your Business to the next level,Acail an Instant Loan With Just one click",
                    onTap: () {
                      Get.to(const doneScreen());
                    });
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))
              .paddingOnly(top: 10, left: 20, right: 20),
          commonListTile(
              title: "Neogrowth",
              onTap: () {
                commonSheet(
                    context: context,
                    title: "Significance",
                    headText: "Neogrowth",
                    discription:
                    "Take your Business to the next level,Acail an Instant Loan With Just one click",
                    onTap: () {
                      Get.to(const doneScreen());
                    });
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))
              .paddingOnly(top: 10, left: 20, right: 20),
          commonListTile(
              title: "Tribe3",
              onTap: () {
                commonSheet(
                    context: context,
                    title: "Significance",
                    headText: "Tribe3",
                    discription:
                    "Take your Business to the next level,Acail an Instant Loan With Just one click",
                    onTap: () {
                      Get.to(const doneScreen());
                    });
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))
              .paddingOnly(top: 10, left: 20, right: 20),
          commonListTile(
              title: "FlexiLoans",
              onTap: () {
                commonSheet(
                    context: context,
                    title: "Significance",
                    headText: "FlexiLoans",
                    discription:
                    "Take your Business to the next level,Acail an Instant Loan With Just one click",
                    onTap: () {
                      Get.to(const doneScreen());
                    });
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent)))
              .paddingOnly(top: 10, left: 20, right: 20),
        ],
      ),
    );
  }
}
