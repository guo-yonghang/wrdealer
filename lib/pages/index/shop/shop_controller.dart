import 'package:get/get.dart';

class ShopController extends GetxController {
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
