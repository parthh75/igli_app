
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/All_Services_model.dart';
import 'package:igli_financial/view/more/My_Services/myServices.dart';

import '../../../../utilities/colors.dart';
import 'all_services_tab/Tax_compliance_Tab.dart';
import 'all_services_tab/business_setup_tab.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  List<Tab> tabs = [
    Tab(child: Text("Business Setup").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Tax & Compliance").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("TradeMark & IP").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Fundraising").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("NGO").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Property & Renewal").paddingSymmetric(horizontal: 20)),

  ];

  List<Widget> tabsContent = [
    BusinessSetupTab(),
    TaxComplianceTab(),
    CompletedTab(),
    ClosedTab(),
    ClosedTab(),
    ClosedTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(

        appBar: AppBar(title: Text("All Services")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                height: 40,
                // color: colorFFFFFF,
                child: TabBar(

                  indicatorColor: Colors.black,
                  isScrollable: true,
                  tabs: tabs,
                  labelColor: colorFFFFFF,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(100),color: colorPrimary),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor:colorPrimary ,
                  //labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),


                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: tabsContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






Widget commonListView(
{
  String? listTitle,
  String? subListTitlePay,
  String? pay,
  bool isNoSubTitle = true,
  }
    ){
  return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorF8F8F8,
            borderRadius:
              BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  color: colorPrimary
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(listTitle ??"Private Limited Company Registration",style: TextStyle(color: colors000000,fontWeight: FontWeight.w700,fontSize: 16),).paddingSymmetric(vertical: 10),

                    isNoSubTitle ? Text("₹${subListTitlePay}/-All inclusive",style: TextStyle(color: colors000000,),).paddingOnly(bottom: 10) : SizedBox()

                  ],
                ),
              )
            ],
          ),
        ).paddingOnly(top: 10),
        Container(
          decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topLeft: Radius.circular(5))
          ),
          child: Text(
              pay ??"",style: TextStyle(color: colorFFFFFF,fontSize: 12),
          ).paddingSymmetric(vertical: 3,horizontal: 3),
        ),
      ],
    );
}
