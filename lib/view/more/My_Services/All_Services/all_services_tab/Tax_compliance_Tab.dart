import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/All_Services_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/tax_compliance_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

class TaxComplianceTab extends StatefulWidget {
  const TaxComplianceTab({Key? key}) : super(key: key);

  @override
  State<TaxComplianceTab> createState() => _TaxComplianceTabState();
}

class _TaxComplianceTabState extends State<TaxComplianceTab> {
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
                Text("Corporate Compliance",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: corporateModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: corporateModel[index].listTitle,
                              subListTitleEx:
                                  corporateModel[index].subListTitleEx,
                              pay: corporateModel[index].pay),
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
                Text("Changes in Pvt Ltd Company",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: changesPvtModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: changesPvtModel[index].listTitle,
                              subListTitleEx:
                                  changesPvtModel[index].subListTitleEx,
                              pay: changesPvtModel[index].pay),
                        ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("GST",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: gstModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: gstModel[index].listTitle,
                              subListTitleEx: gstModel[index].subListTitleEx,
                              pay: gstModel[index].pay,
                              isNoSubTitle: index == 1 ? false : true),
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
                Text("Accounting & Tax",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: accountingModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: accountingModel[index].listTitle,
                              subListTitleEx:
                                  accountingModel[index].subListTitleEx,
                              pay: accountingModel[index].pay),
                        ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Labour Compliance",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: labourModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: labourModel[index].listTitle,
                              subListTitleEx: labourModel[index].subListTitleEx,
                              pay: labourModel[index].pay),
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
                Text("Changes In Limited Liability Partnership",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: changesLLPModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: changesLLPModel[index].listTitle,
                              subListTitleEx:
                                  changesLLPModel[index].subListTitleEx,
                              pay: changesLLPModel[index].pay),
                        ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Convert Your Business",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: colors000000,
                        fontSize: 18)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: convertBusinessModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ListDetailPage()),
                          child: commonListView(
                              listTitle: convertBusinessModel[index].listTitle,
                              subListTitleEx:
                                  convertBusinessModel[index].subListTitleEx,
                              pay: convertBusinessModel[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
