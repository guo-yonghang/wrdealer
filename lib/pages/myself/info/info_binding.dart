import 'package:get/get.dart';
import './info_controller.dart';

class MyselfInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyselfInfoController>(() => MyselfInfoController());
  }
}
