import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/ngo_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/tax_compliance_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

class NgoTab extends StatefulWidget {
  const NgoTab({Key? key}) : super(key: key);

  @override
  State<NgoTab> createState() => _NgoTabState();
}

class _NgoTabState extends State<NgoTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Registration",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:corporateModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: ()=> Get.to(()=>ListDetailPage()),
                      child: commonListView(

                          listTitle: registrationModel[index].listTitle,
                          subListTitlePay: registrationModel[index].subListTitlePay,
                          pay: registrationModel[index].pay
                      ),
                    ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NGO Compliance",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:ngoModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: ()=> Get.to(()=>ListDetailPage()),

                      child: commonListView(
                          listTitle: ngoModel[index].listTitle,
                          subListTitlePay: ngoModel[index].subListTitlePay,
                          pay: ngoModel[index].pay,
                          isNoSubTitle: index == 0 ? false : true
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
