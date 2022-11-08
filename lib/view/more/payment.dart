import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utilities/colors.dart';
import 'myServices.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  List<Tab> tabs = [
    Tab(child: Text("Due").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Completed").paddingSymmetric(horizontal: 20)),

  ];
  List<Widget> tabsContent = [
    OngoingTab(),
    RenewalTab(),

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(

        backgroundColor: colorFFFFFF,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                height: 40,
                color: colorFFFFFF,
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



class OngoingTab extends StatefulWidget {
  const OngoingTab({Key? key}) : super(key: key);

  @override
  State<OngoingTab> createState() => _OngoingTabState();
}

class _OngoingTabState extends State<OngoingTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Due"),));
  }
}


class RenewalTab extends StatefulWidget {
  const RenewalTab({Key? key}) : super(key: key);

  @override
  State<RenewalTab> createState() => _RenewalTabState();
}

class _RenewalTabState extends State<RenewalTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Completed"),));
  }
}