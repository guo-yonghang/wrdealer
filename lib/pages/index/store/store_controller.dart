import 'package:get/get.dart';

class StoreController extends GetxController {
  final RxInt index = 0.obs;
  final List workList = [
    {
      "name": '商机单',
      "img": "",
      "count": 10,
    },
    {
      "name": '商机订单',
      "img": "",
      "count": 0,
    },
    {
      "name": '电商订单',
      "img": "",
      "count": 0,
    },
    {
      "name": '积分订单',
      "img": "",
      "count": 11,
    },
    {
      "name": '预约单',
      "img": "",
      "count": 0,
    },
    {
      "name": '商品管理',
      "img": "",
      "count": 0,
    },
    {
      "name": '活动中心',
      "img": "",
      "count": 0,
    },
    {
      "name": '核销',
      "img": "",
      "count": 0,
    },
  ];
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
