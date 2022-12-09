

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Api_class.dart';
import '../../utilities/string.dart';
import 'home_page_modal.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();


  Rx<HomePageModal> homePageModal = HomePageModal().obs;
  RxList<Banner> bannerList = <Banner>[].obs;

 homePageCall(Map<String, dynamic> params, {Function? callBack}) {
    Api().call(
      params: params,
      serviceUrl: ApiConfig.home,
      success: (response) {
        homePageModal.value = HomePageModal.fromJson(response);
        print("====>${homePageModal.value.message}");
        // if (homePageModal.value.success == true) {
        //   proffessionList.value = homePageModal.value.data ?? [];
        // }
        if (callBack != null) {
          callBack();
        }
      },
      error: (response) {
        //showSnackBar(title: ApiConfig.error, message: response["message"]);
      },
      isProgressShow: true,
      methodType: MethodType.post,
    );
  }
}