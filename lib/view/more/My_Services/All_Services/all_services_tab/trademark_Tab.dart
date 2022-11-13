import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/business_setup_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/trademark_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';

import '../list_detail_page.dart';

class TrademarkTab extends StatefulWidget {
  const TrademarkTab({Key? key}) : super(key: key);

  @override
  State<TrademarkTab> createState() => _TrademarkTabState();
}

class _TrademarkTabState extends State<TrademarkTab> {
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
                Text("Trademark",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:trademarkModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){Get.to(ListDetailPage(
                        appTitle: trademarkModel[index].listTitle,
                        onPay: trademarkModel[index].subListTitlePay,
                        index:trademarkModel.length,description: trademarkModel[index].description,
                        benefits: trademarkModel[index].benefits,
                        deliverables: trademarkModel[index].deliverables,
                        deliverablesTab: trademarkModel[index].deliverablesTab,
                        documents: trademarkModel[index].documents,
                        duration: trademarkModel[index].duration,
                        penalty: trademarkModel[index].penalty,
                      ));},
                      child: commonListView(
                          listTitle: trademarkModel[index].listTitle,
                          subListTitlePay: trademarkModel[index].subListTitlePay,
                          pay: trademarkModel[index].pay
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
                Text("Copyright",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                GestureDetector(
                  onTap: ()=>Get.to(()=>ListDetailPage()),
                  child: commonListView(

                    pay: "Pay ₹499/-to get started",
                      subListTitlePay: "3509",
                      listTitle: "Copyright Registration",),
                )
              ],
            ),
          ),

          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Patent",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:patentModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: ()=> Get.to(()=>ListDetailPage(
                        appTitle: patentModel[index].listTitle,
                        onPay: patentModel[index].subListTitlePay,
                        index:patentModel.length,description: patentModel[index].description,
                        benefits: patentModel[index].benefits,
                        deliverables: patentModel[index].deliverables,
                        deliverablesTab: patentModel[index].deliverablesTab,
                        documents: patentModel[index].documents,
                        duration: patentModel[index].duration,
                        penalty: patentModel[index].penalty,
                      )),
                      child: commonListView(

                          listTitle: patentModel[index].listTitle,
                          subListTitlePay: patentModel[index].subListTitlePay,
                          pay: patentModel[index].pay
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