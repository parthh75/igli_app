import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/utilities/string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? gender;
  bool isButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 25, color: colorPrimary),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(CS.personalDetails, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ).paddingOnly(top: 10),
                  const Center(child: Icon(Icons.account_circle, size: 100, color: Colors.grey)),
                  Center(
                      child: Text(
                    CS.dUserName,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ).paddingOnly(bottom: 2, top: 5)),
                  Center(
                      child: Text(
                    CS.dEmail,
                    style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
                  )),
                  Text(CS.fullName).paddingOnly(top: 20),
                  TextFormField(onTap: () {
                    setState(() {
                      isButton = true;
                    });
                  }),
                  Text(CS.dob).paddingOnly(top: 20),
                  TextFormField(),
                  Text(
                    CS.gender,
                  ).paddingOnly(top: 20),
                  RadioListTile(
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                        isButton = true;
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
                        isButton = true;
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
                        isButton = true;
                      });
                    },
                    title: Text(CS.other),
                  ),
                  isButton
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      isButton = false;
                                    });
                                  },
                                  child: Text("Cancle")),
                            ),
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), onPressed: () {}, child: const Text("Save")),
                            ),
                          ],
                        ).paddingOnly(bottom: 20, top: 10)
                      : SizedBox()
                ],
              ).paddingSymmetric(horizontal: 20),
            ).paddingOnly(top: 20)
          ],
        ),
      ),
    );
  }
}
