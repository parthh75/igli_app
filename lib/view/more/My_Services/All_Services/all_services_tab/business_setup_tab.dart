import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:igli_financial/utilities/colors.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/Model/All_Services_model.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/all_services.dart';
import 'package:igli_financial/view/more/My_Services/All_Services/list_detail_page.dart';

import '../Model/business_setup_modal.dart';

class BusinessSetupTab extends StatelessWidget {
  const BusinessSetupTab({Key? key}) : super(key: key);

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
                    itemCount: businessSetupModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(ListDetailPage(
                              appTitle: businessSetupModel[index].listTitle,
                              subListTitleExPay:
                                  businessSetupModel[index].subListTitleEx,
                              subListTitleInPay:
                                  businessSetupModel[index].subListTitleIn,
                              index: businessSetupModel.length,
                              description:
                                  businessSetupModel[index].description,
                              benefits: businessSetupModel[index].benefits,
                              deliverables:
                                  businessSetupModel[index].deliverables,
                              deliverablesTab:
                                  businessSetupModel[index].deliverablesTab,
                              documents: businessSetupModel[index].documents,
                              duration: businessSetupModel[index].duration,
                              penalty: businessSetupModel[index].penalty,
                            ));
                          },
                          child: commonListView(
                              listTitle: businessSetupModel[index].listTitle,
                              subListTitleEx:
                                  businessSetupModel[index].subListTitleEx,
                              subListTitleIn:
                                  businessSetupModel[index].subListTitleIn,
                              pay: businessSetupModel[index].pay),
                        ))
              ],
            ),
          ).paddingSymmetric(vertical: 10),
        ],
      ),
    );
  }
}
