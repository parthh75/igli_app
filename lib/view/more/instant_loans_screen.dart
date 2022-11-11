import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/common_widgets/common.dart';
import 'package:igli_financial/common_widgets/done_screen.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';
import 'package:igli_financial/view/more/more_main.dart';
import 'package:igli_financial/view/more/myprofile.dart';
import 'package:igli_financial/view/more/ourpartnerservicescreen.dart';
import 'package:intl/intl.dart';

class InstantLoansScreen extends StatefulWidget {
  const InstantLoansScreen({Key? key}) : super(key: key);

  @override
  State<InstantLoansScreen> createState() => _InstantLoansScreenState();
}

class _InstantLoansScreenState extends State<InstantLoansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Instant Loans")),
      body: Column(
        children: [
          commonListTile(
                  title: "MoneyTap",
                  onTap: () {
                    Get.to(const MoneyTapScreen());
                  },
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

class MoneyTapScreen extends StatefulWidget {
  const MoneyTapScreen({Key? key}) : super(key: key);

  @override
  State<MoneyTapScreen> createState() => _MoneyTapScreenState();
}

class _MoneyTapScreenState extends State<MoneyTapScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController workExperienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  String? gender;
  dynamic items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MoneyTap"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About MoneyTap",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ).paddingOnly(top: 20, bottom: 15),
            const Expanded(
              child: Text(
                "Get a Domain of Your Own and Give Your Business a Better Reach",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            const Text(
              "Few More Details Before Completion",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ).paddingOnly(bottom: 20),
            const Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            commonTextField(controller: nameController).paddingOnly(bottom: 20),
            const Text(
              "Pan Number",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            commonTextField(controller: panNumberController)
                .paddingOnly(bottom: 20),
            const Text(
              "Date Of Birth",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            commonTextField(
              controller: dobController,
              suffixIcon: Icon(Icons.date_range, color: colorPrimary),
              onTap: () {
                setState(
                  () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    ).then((value) => {
                          dobController.text =
                              DateFormat.yMd().format(value!).toString(),
                        });
                  },
                );
              },
            ).paddingOnly(bottom: 20),
            const Text("Monthly Salary"),
            commonTextField(
              controller: salaryController,
            ).paddingOnly(bottom: 20),
            const Text("Total Work Experience In Months"),
            commonTextField(
              controller: workExperienceController,
            ).paddingOnly(bottom: 20),
            Text(
              CS.gender,
              style: TextStyle(fontWeight: FontWeight.bold),
            ).paddingOnly(top: 20),
            RadioListTile(
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
              title: Text(CS.male),
            ),
            RadioListTile(
              value: "female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
              title: Text(CS.female),
            ),
            RadioListTile(
              value: "other",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });
              },
              title: Text(CS.other),
            ),
            const Text("Address"),
            commonTextField(
              controller: addressController,
            ).paddingOnly(bottom: 20),
            const Text("Pincode"),
            commonTextField(
              controller: pincodeController,
            ),
          ],
        ).paddingSymmetric(horizontal: 15),
      ),
      bottomNavigationBar: commonElevatedButton(
          onTap: () {}, title: "Create Account", horizontalPadding: 150),
    );
  }
}
