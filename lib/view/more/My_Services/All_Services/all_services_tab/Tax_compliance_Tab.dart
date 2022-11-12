import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/All_Services_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';

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
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Corporate Compliance",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:corporateModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: corporateModel[index].listTitle,
                        subListTitlePay: corporateModel[index].subListTitlePay,
                        pay: corporateModel[index].pay
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
                Text("Changes in Pvt Ltd Company",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:changesPvtModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: changesPvtModel[index].listTitle,
                        subListTitlePay: changesPvtModel[index].subListTitlePay,
                        pay: changesPvtModel[index].pay
                    ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("GST",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:gstModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: gstModel[index].listTitle,
                        subListTitlePay: gstModel[index].subListTitlePay,
                        pay: gstModel[index].pay,
                      isNoSubTitle: index == 1 ? false : true
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
                Text("Accounting & Tax",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:accountingModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: accountingModel[index].listTitle,
                        subListTitlePay: accountingModel[index].subListTitlePay,
                        pay: accountingModel[index].pay
                    ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Labour Compliance",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:labourModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: labourModel[index].listTitle,
                        subListTitlePay: labourModel[index].subListTitlePay,
                        pay: labourModel[index].pay
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
                Text("Changes In Limited Liability Partnership",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:changesLLPModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: changesLLPModel[index].listTitle,
                        subListTitlePay: changesLLPModel[index].subListTitlePay,
                        pay: changesLLPModel[index].pay
                    ))
              ],
            ),
          ),
          Container(
            color: colorFFFFFF,
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Convert Your Business",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors000000,fontSize: 18
                )),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:convertBusinessModel.length,
                    itemBuilder: (context, index) => commonListView(
                        listTitle: convertBusinessModel[index].listTitle,
                        subListTitlePay: convertBusinessModel[index].subListTitlePay,
                        pay: convertBusinessModel[index].pay
                    ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
