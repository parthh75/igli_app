import 'package:get/get.dart';

import 'main_screen_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<MainScreenController>(MainScreenController(), permanent: true);
  }
}
