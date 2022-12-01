import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/colors.dart';
import '../utilities/common_taxfield.dart';
import '../utilities/text_style.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colorFFFFFF,
              child: Image.asset("assets/image/igliLogoIcon.png", height: 30),
            ).paddingAll(6),
            Text("Team IGLI ", style: themeData.textTheme.headline5?.copyWith(color: colorFFFFFF, fontSize: 18)).paddingOnly(left: 5),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: index.isEven ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: colorEAEAEA,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15), topLeft: Radius.circular(index.isEven ? 15 : 0), topRight: Radius.circular(index.isEven ? 0 : 15))),
                      child: Text("IGLI Financial", style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 15)).paddingAll(10),
                    ).paddingAll(10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: searchMethod(),
    );
  }

  Widget searchMethod() {
    return Container(
      color: colorFFFFFF,
      height: 40,
      child: Row(children: [
        Expanded(
            child: commonTextFormField(
                textFieldHeight: 40,
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
                preFixIcon: Image.asset("assets/image/igliLogoIcon.png").paddingAll(7),
                hintText: "Enter Your Question...")),
        CircleAvatar(
          radius: 30,
          backgroundColor: colorEAEAEA,
          child: Icon(Icons.send_rounded),
        )
      ]).paddingOnly(left: 15, right: 5),
    ).paddingOnly(top: 15, bottom: 15);
  }
}
