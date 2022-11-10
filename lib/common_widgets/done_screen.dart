import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/myprofile.dart';

class doneScreen extends StatefulWidget {
  const doneScreen({Key? key}) : super(key: key);

  @override
  State<doneScreen> createState() => _doneScreenState();
}

class _doneScreenState extends State<doneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 100, color: color33d067),
          const Text(
            "Your Request has been crreated.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ).paddingOnly(top: 15, bottom: 10),
          const Text(
            "one of the agent will get back to you shortly.",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          commonElevatedButton(
                  onTap: () {
                    Get.back();
                    Get.back();
                    Get.back();
                  },
                  horizontalPadding: 200,
                  title: "Close",
                  buttonColor: colorPrimary)
              .paddingOnly(top: 15)
        ],
      ),
    );
  }
}
