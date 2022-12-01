import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/text_style.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification", style: themeData.textTheme.headline5?.copyWith(color: colorFFFFFF, fontSize: 18))),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 70,
                  decoration: BoxDecoration(color: colorFFFFFF),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Festival Offer :)", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 15)).paddingOnly(bottom: 5),
                          Text("get 20% off on all services grab now!  ", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 12)),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: colorPrimary,
                      )
                    ],
                  ).paddingAll(10),
                ).paddingOnly(top: 10);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchMethod() {
    return Container(
      color: colorFFFFFF,
      child: Row(children: [
        Expanded(
            child: commonTextFormField(
                textFieldHeight: 45,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(7),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorPrimary.withOpacity(0.9)),
                  borderRadius: BorderRadius.circular(7),
                ),
                suffixIcon: Image.asset("assets/image/igliLogoIcon.png").paddingAll(7),
                preFixIcon: Icon(Icons.search, color: colorPrimary.withOpacity(0.9)),
                hintText: "Search Services..."))
      ]).paddingSymmetric(horizontal: 15),
    ).paddingOnly(top: 15, bottom: 15);
  }
}
