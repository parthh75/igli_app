import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services_tab/good_Services_Tax_screen.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services_tab/incometax_accounting_screen.dart';

import '../../../../utilities/colors.dart';
import '../../../../utilities/string.dart';
import 'all_services_tab/business_setup_tab.dart';
import 'all_services_tab/trademark_Tab.dart';

class AllServices extends StatefulWidget {
  const AllServices({Key? key}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  List<Tab> tabs = [
    Tab(child: const Text("Business Setup").paddingSymmetric(horizontal: 20)),
    Tab(child: const Text("TRADEMARK & IP").paddingSymmetric(horizontal: 20)),
    Tab(child: const Text("GOOD & SERVICES TAX").paddingSymmetric(horizontal: 20)),
    Tab(child: const Text("INCOME TAX & ACCOUNTING").paddingSymmetric(horizontal: 20)),
  ];

  List<Widget> tabsContent = [
    const BusinessSetupTab(),
    const TrademarkTab(),
    const GoodServiceTaxScreen(),
    const IncomeTaxScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: CS.tag,
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          // appBar: AppBar(title: const Text("All Services")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Container(
                  height: 40,
                  // color: colorFFFFFF,
                  child: TabBar(
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    tabs: tabs,
                    labelColor: colorFFFFFF,
                    indicator: BoxDecoration(borderRadius: BorderRadius.circular(100), color: colorPrimary),
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                    unselectedLabelColor: colorPrimary,
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
      ),
    );
  }
}

Widget commonListView({
  String? listTitle,
  String? subListTitleEx,
  String? subListTitleIn,
  String? pay,
  bool isNoSubTitle = true,
}) {
  return GestureDetector(
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorF8F8F8,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 90,
                decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)), color: colorPrimary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listTitle ?? "Private Limited Company Registration",
                      style: TextStyle(color: colors000000, fontWeight: FontWeight.w700, fontSize: 16),
                    ).paddingSymmetric(vertical: 10),
                    isNoSubTitle
                        ? Column(
                            children: [
                              Text(
                                "₹$subListTitleEx/-excl.GST",
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ).paddingOnly(bottom: 10),
                              Text(
                                "₹$subListTitleIn/-incl.GST",
                                style: TextStyle(
                                  color: colors000000,
                                ),
                              ).paddingOnly(bottom: 10),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              )
            ],
          ),
        ).paddingOnly(top: 10),
        Container(
          decoration: BoxDecoration(color: colorPrimary, borderRadius: const BorderRadius.only(bottomRight: Radius.circular(5), topLeft: Radius.circular(5))),
          child: Text(
            "GST Credit ₹ $pay/-",
            style: TextStyle(color: colorFFFFFF, fontSize: 12),
          ).paddingSymmetric(vertical: 3, horizontal: 3),
        ),
      ],
    ),
  );
}
