import 'package:get/get.dart';
import '../../../common/staticData.dart';

class ShopController extends GetxController {
  final RxInt index = 0.obs;
  final List indexGrids = StaticData.indexGrids.obs;

  RxList infoStepList = [
    {
      "name": "完善资料",
      "btnText": "去完善",
    },
    {
      "name": "资料审核中",
      "btnText": "联系客服",
    },
    {
      "name": "资料已完善",
    },
  ].obs;

  RxList acctStepList = [
    {
      "name": "账薄开户（开通账薄使用收款功能）",
      "btnText": "去开通",
    },
    {
      "name": "账薄已开通",
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setCurrentIndex(int value) {
    index.value = value;
    update();
  }
}
