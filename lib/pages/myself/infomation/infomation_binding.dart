import 'package:get/get.dart';
import 'infomation_controller.dart';

class MyselfInfomationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyselfInfomationController>(() => MyselfInfomationController());
  }
}
