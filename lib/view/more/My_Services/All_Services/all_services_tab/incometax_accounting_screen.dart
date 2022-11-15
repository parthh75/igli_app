import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/business_setup_modal.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

import '../all_services.dart';

class IncomeTaxScreen extends StatelessWidget {
  const IncomeTaxScreen({Key? key}) : super(key: key);

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
                    itemCount: incomeTxaServiceModal.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(ListDetailPage(
                              appTitle: incomeTxaServiceModal[index].listTitle,
                              subListTitleExPay:
                                  incomeTxaServiceModal[index].subListTitleEx,
                              subListTitleInPay:
                                  incomeTxaServiceModal[index].subListTitleIn,
                              index: incomeTxaServiceModal.length,
                              description:
                                  incomeTxaServiceModal[index].description,
                              benefits: incomeTxaServiceModal[index].benefits,
                              deliverables:
                                  incomeTxaServiceModal[index].deliverables,
                              deliverablesTab:
                                  incomeTxaServiceModal[index].deliverablesTab,
                              documents: incomeTxaServiceModal[index].documents,
                              duration: incomeTxaServiceModal[index].duration,
                              penalty: incomeTxaServiceModal[index].penalty,
                            ));
                          },
                          child: commonListView(
                              listTitle: incomeTxaServiceModal[index].listTitle,
                              subListTitleEx:
                                  incomeTxaServiceModal[index].subListTitleEx,
                              subListTitleIn:
                                  incomeTxaServiceModal[index].subListTitleIn,
                              pay: incomeTxaServiceModal[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
