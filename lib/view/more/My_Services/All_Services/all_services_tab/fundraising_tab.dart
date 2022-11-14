import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

class FundraisingTab extends StatefulWidget {
  const FundraisingTab({Key? key}) : super(key: key);

  @override
  State<FundraisingTab> createState() => _FundraisingTabState();
}

class _FundraisingTabState extends State<FundraisingTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fundraising",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                GestureDetector(
                  onTap: () => Get.to(() => ListDetailPage()),
                  child: commonListView(
                    pay: "Pay ₹499/-to get started",
                    subListTitleEx: "39998",
                    listTitle: "Fundraising",
                  ),
                )
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
