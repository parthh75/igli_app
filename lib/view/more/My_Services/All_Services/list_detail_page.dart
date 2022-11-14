import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/myServices.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ListDetailPage extends StatefulWidget {
  int? index;
  String? description;
  String? duration;
  String? deliverables;
  String? penalty;
  String? benefits;
  String? deliverablesTab;
  String? documents;
  String? appTitle;
  String? subListTitleExPay;
  String? subListTitleInPay;

  ListDetailPage(
      {Key? key,
      this.index,
      this.description,
      this.benefits,
      this.deliverables,
      this.duration,
      this.penalty,
      this.deliverablesTab,
      this.documents,
      this.appTitle,
      this.subListTitleExPay,
      this.subListTitleInPay})
      : super(key: key);

  @override
  State<ListDetailPage> createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  List<Tab> tabs = [
    Tab(child: Text("Ongoing").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Benefits").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Documents").paddingSymmetric(horizontal: 20)),
    Tab(child: Text("Deliverables").paddingSymmetric(horizontal: 20)),
  ];

  // List<Widget> tabsContent = [
  //   overViewTab(Description: description ?? ""),
  //   benefitsTab(),
  //   documentsTab(),
  //   deliverablesTab()
  // ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle ?? "Title"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.appTitle ?? "Title",
              style: TextStyle(
                  color: colorPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ).paddingSymmetric(vertical: 20, horizontal: 15),
            Row(
              children: [
                Text("₹${widget.subListTitleExPay}/-",
                    style: TextStyle(color: colorPrimary, fontSize: 25)),
                Text("All inclusive"),
              ],
            ).paddingSymmetric(horizontal: 15),
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
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: colorPrimary),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  unselectedLabelColor: colorPrimary,
                  //labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                ),
              ),
            ).paddingSymmetric(vertical: 15),
            Expanded(
              child: TabBarView(
                children: [
                  overViewTab(
                    description: widget.description ?? "",
                    duration: widget.duration ?? "",
                    deliverables: widget.deliverables ?? "",
                    penalty: widget.penalty ?? "",
                  ),
                  benefitsTab(
                    benefits: widget.benefits ?? "",
                  ),
                  documentsTab(documents: widget.documents ?? ""),
                  deliverablesTab(deliverables: widget.deliverablesTab ?? "")
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConfirmationSlider(
          text: "Purchase Now",
          textStyle: TextStyle(
              color: colorPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              decorationColor: colorPrimary,
              letterSpacing: 8,
              decorationThickness: 50),
          onConfirmation: () {
            Get.to(PurchaseNowScreen());
          },
          iconColor: colorPrimary,
        ).paddingSymmetric(horizontal: 10, vertical: 20),
        // SliderButton(
        //   action: () {
        //     ///Do something here OnSlide
        //     print("working");
        //   },
        //   ///Put label over here
        //   label: Text(
        //     "purchase now",
        //     style: TextStyle(
        //         color: Color(0xff4a4a4a),
        //         fontWeight: FontWeight.w500,
        //         fontSize: 17),
        //   ),
        //   icon: Center(
        //       child: Icon(
        //         Icons.power_settings_new,
        //         color: Colors.white,
        //         size: 40.0,
        //         semanticLabel: 'Text to announce in accessibility modes',
        //       )),
        //
        //   //Put BoxShadow here
        //   boxShadow: BoxShadow(
        //     color: Colors.black,
        //     blurRadius: 4,
        //   ),
        //
        //   //Adjust effects such as shimmer and flag vibration here
        //   shimmer: true,
        //   vibrationFlag: true,
        //
        //   ///Change All the color and size from here.
        //   width: 230,
        //   radius: 10,
        //   buttonColor: Color(0xffd60000),
        //   backgroundColor: Color(0xff534bae),
        //   highlightedColor: Colors.white,
        //   baseColor: Colors.red,
        // ),
      ),
    );
  }
}

Widget overViewTab({
  String? description,
  String? duration,
  String? deliverables,
  String? penalty,
}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(title: "Description", subTitle: description ?? "")
            .paddingOnly(bottom: 15),
        commonText(
            title: "Duration",
            subTitle: duration ??
                "The process usually takes about 7-10 business days."),
        commonText(title: "Deliverables", subTitle: deliverables ?? "")
            .paddingOnly(bottom: 25, top: 15),
        commonText(title: "Penalty", subTitle: penalty ?? "Yes"),
      ],
    ).paddingSymmetric(horizontal: 15),
  );
}

Widget benefitsTab({
  String? benefits,
}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(title: "Benefits", subTitle: benefits ?? ""),
      ],
    ).paddingSymmetric(horizontal: 15),
  );
}

Widget documentsTab({String? documents}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(title: "Documents", subTitle: documents ?? ""),
      ],
    ).paddingSymmetric(horizontal: 15),
  );
}

Widget deliverablesTab({String? deliverables}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(title: "Deliverables", subTitle: deliverables ?? ""),
      ],
    ).paddingSymmetric(horizontal: 15),
  );
}

Widget commonText({String? title, String? subTitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title ?? "Description",
        style: TextStyle(
            fontSize: 15, color: colorPrimary, fontWeight: FontWeight.w600),
      ),
      Text(
        subTitle ?? "Description",
        style: TextStyle(
            fontSize: 13, color: colors000000, fontWeight: FontWeight.w500),
      ).paddingOnly(top: 3),
    ],
  );
}

class PurchaseNowScreen extends StatefulWidget {
  const PurchaseNowScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseNowScreen> createState() => _PurchaseNowScreenState();
}

class _PurchaseNowScreenState extends State<PurchaseNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "coming soon",
      style: TextStyle(
          color: colorPrimary, fontWeight: FontWeight.w600, fontSize: 16),
    ));
  }
}
