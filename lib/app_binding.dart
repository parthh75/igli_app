import 'package:get/get.dart';
import 'controller/main_screen_controller.dart';
import 'model/home_page/home_contrroler.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<HomePageController>(HomePageController(), permanent: true);
    Get.put<MainScreenController>(MainScreenController(), permanent: true);
  }
}
