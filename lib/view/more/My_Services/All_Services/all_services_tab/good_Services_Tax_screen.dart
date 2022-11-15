import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/business_setup_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

class GoodServiceTaxScreen extends StatefulWidget {
  const GoodServiceTaxScreen({Key? key}) : super(key: key);

  @override
  State<GoodServiceTaxScreen> createState() => _GoodServiceTaxScreenState();
}

class _GoodServiceTaxScreenState extends State<GoodServiceTaxScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: colorFFFFFF,
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: goodServiceTaxModal.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(ListDetailPage(
                              appTitle: goodServiceTaxModal[index].listTitle,
                              subListTitleExPay:
                                  goodServiceTaxModal[index].subListTitleEx,
                              subListTitleInPay:
                                  goodServiceTaxModal[index].subListTitleIn,
                              index: goodServiceTaxModal.length,
                              description:
                                  goodServiceTaxModal[index].description,
                              benefits: goodServiceTaxModal[index].benefits,
                              deliverables:
                                  goodServiceTaxModal[index].deliverables,
                              deliverablesTab:
                                  goodServiceTaxModal[index].deliverablesTab,
                              documents: goodServiceTaxModal[index].documents,
                              duration: goodServiceTaxModal[index].duration,
                              penalty: goodServiceTaxModal[index].penalty,
                            ));
                          },
                          child: commonListView(
                              listTitle: goodServiceTaxModal[index].listTitle,
                              subListTitleEx:
                                  goodServiceTaxModal[index].subListTitleEx,
                              subListTitleIn:
                                  goodServiceTaxModal[index].subListTitleIn,
                              pay: goodServiceTaxModal[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
