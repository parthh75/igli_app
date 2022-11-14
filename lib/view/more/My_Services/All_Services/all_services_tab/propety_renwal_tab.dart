import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/propety_renwal_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/trademark_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

class PropertyTab extends StatefulWidget {
  const PropertyTab({Key? key}) : super(key: key);

  @override
  State<PropertyTab> createState() => _PropertyTabState();
}

class _PropertyTabState extends State<PropertyTab> {
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
                Text("Property",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                GestureDetector(
                  onTap: () => Get.to(() => ListDetailPage()),
                  child: commonListView(
                    pay: "Pay ₹499/-to get started",
                    subListTitleEx: "11799",
                    listTitle: "Property Registration",
                  ),
                )
              ],
            ),
          ).paddingSymmetric(vertical: 10),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name Change & Other Conditions",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nameChangeModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(ListDetailPage(
                              appTitle: nameChangeModel[index].listTitle,
                              subListTitleExPay:
                                  nameChangeModel[index].subListTitleEx,
                              index: nameChangeModel.length,
                              description: nameChangeModel[index].description,
                              benefits: nameChangeModel[index].benefits,
                              deliverables: nameChangeModel[index].deliverables,
                              deliverablesTab:
                                  nameChangeModel[index].deliverablesTab,
                              documents: nameChangeModel[index].documents,
                              duration: nameChangeModel[index].duration,
                              penalty: nameChangeModel[index].penalty,
                            ));
                          },
                          child: commonListView(
                              listTitle: nameChangeModel[index].listTitle,
                              subListTitleEx:
                                  nameChangeModel[index].subListTitleEx,
                              pay: nameChangeModel[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Marriage",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: marriageModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage(
                                appTitle: marriageModel[index].listTitle,
                                subListTitleExPay:
                                    marriageModel[index].subListTitleEx,
                                index: marriageModel.length,
                                description: marriageModel[index].description,
                                benefits: marriageModel[index].benefits,
                                deliverables: marriageModel[index].deliverables,
                                deliverablesTab:
                                    marriageModel[index].deliverablesTab,
                                documents: marriageModel[index].documents,
                                duration: marriageModel[index].duration,
                                penalty: marriageModel[index].penalty,
                              )),
                          child: commonListView(
                              listTitle: marriageModel[index].listTitle,
                              subListTitleEx:
                                  marriageModel[index].subListTitleEx,
                              pay: marriageModel[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
