import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/All_Services_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

import '../Model/business_setup_modal.dart';

class BusinessSetupTab extends StatelessWidget {
  const BusinessSetupTab({Key? key}) : super(key: key);

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
                Text("Business Registration",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:businessSetupModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){Get.to(ListDetailPage(
                        appTitle: businessSetupModel[index].listTitle,
                        onPay: businessSetupModel[index].subListTitlePay,
                        index:businessSetupModel.length,description: businessSetupModel[index].description,
                        benefits: businessSetupModel[index].benefits,
                        deliverables: businessSetupModel[index].deliverables,
                        deliverablesTab: businessSetupModel[index].deliverablesTab,
                        documents: businessSetupModel[index].documents,
                        duration: businessSetupModel[index].duration,
                        penalty: businessSetupModel[index].penalty,
                      ));},
                      child: commonListView(
                          listTitle: businessSetupModel[index].listTitle,
                          subListTitlePay: businessSetupModel[index].subListTitlePay,
                          pay: businessSetupModel[index].pay
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
                Text("International Business Setup",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                GestureDetector(
                    onTap: (){Get.to(ListDetailPage());},
                    child: commonListView(listTitle: "USA Company Incorporation",isNoSubTitle: false))
              ],
            ),
          ),

          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Licenses & Registrations",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:licensesModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){Get.to(ListDetailPage(
                        appTitle: licensesModel[index].listTitle,
                        onPay: licensesModel[index].subListTitlePay,
                        index:licensesModel.length,description: licensesModel[index].description,
                        benefits: licensesModel[index].benefits,
                        deliverables: licensesModel[index].deliverables,
                        deliverablesTab: licensesModel[index].deliverablesTab,
                        documents: licensesModel[index].documents,
                        duration: licensesModel[index].duration,
                        penalty: licensesModel[index].penalty,
                      ));},
                      child: commonListView(
                          listTitle: licensesModel[index].listTitle,
                          subListTitlePay: licensesModel[index].subListTitlePay,
                          pay: licensesModel[index].pay
                      ),
                    ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}