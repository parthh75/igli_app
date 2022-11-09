import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  List<Tab> tabs = [
    Tab(child: Text("Ongoing").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Renewal").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Completed").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Colsed").paddingSymmetric(horizontal: 20)),

  ];

  List<Widget> tabsContent = [
    OngoingTab(),
    RenewalTab(),
    CompletedTab(),
    ClosedTab()
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
    return Center(child: ElevatedButton(
      onPressed: (){Get.to(AllServices());},
      child: Text("Explore Services"),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colorPrimary)),
    ));
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
    return Center(child: Container(child: Text("Renewal"),));
  }
}

class CompletedTab extends StatefulWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Completed"),));
  }
}

class ClosedTab extends StatefulWidget {
  const ClosedTab({Key? key}) : super(key: key);

  @override
  State<ClosedTab> createState() => _ClosedTabState();
}

class _ClosedTabState extends State<ClosedTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text("Closed"),));
  }
}
