import 'package:get/get.dart';
import './qrcode_controller.dart';

class MyselfQrcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyselfQrcodeController>(() => MyselfQrcodeController());
  }
}
