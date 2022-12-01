import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import '../common_widgets/common.dart';
import '../utilities/colors.dart';
import '../utilities/text_style.dart';
import 'more/My_Services/All_Services/list_detail_page.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Inc-20a"
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("INC-20A",style: themeData.textTheme.headline5?.copyWith(color: colors000000, fontSize: 18)),
            DottedLine(dashColor: colorPrimary,).paddingSymmetric(vertical: 15),
            commonText(title: "Due date", subTitle:  "within 180 days from DoI").paddingOnly(bottom: 15),
            commonText(title: "Description", subTitle:  "INC-20A (Declaration of Commencement of business)").paddingOnly(bottom: 15),
            commonText(title: "Applicable for", subTitle:  "Incorported after 04nd Nov 2018").paddingOnly(bottom: 15),
            commonText(title: "Penalty", subTitle:  "within 180 days from DoI").paddingOnly(bottom: 15),
            commonText(title: "Law", subTitle:  "within 180 days from DoI").paddingOnly(bottom: 15),
            commonText(title: "Legal entity", subTitle:  "-within 180 days from DoI\n-within 180 days from DoI\n-within 180 days from DoI\n-within 180 days from DoI\n-within 180 days from DoI").paddingOnly(bottom: 15),

          ],
        ),
      ),
      bottomNavigationBar: ConfirmationSlider(sliderButtonContent: CircleAvatar(backgroundColor: colorPrimary,child: Icon(Icons.arrow_forward_ios,color: colorFFFFFF,)),
        text: "I'm Interested/",
        textStyle: TextStyle(color: colorPrimary, fontWeight: FontWeight.w600, fontSize: 16, decorationColor: colorPrimary, letterSpacing: 8, decorationThickness: 50),
        onConfirmation: () {
          Get.to(const PurchaseNowScreen());
        },
        iconColor: colorPrimary,
      ).paddingSymmetric(horizontal: 10, vertical: 20),
    );
  }
}
