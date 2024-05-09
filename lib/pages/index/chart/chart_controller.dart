import 'package:get/get.dart';

class ChartController extends GetxController {
  final RxInt index = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentIndex(int value) {
    index.value = value;
    update();
  }
}
