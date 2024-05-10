import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartController extends GetxController with SingleGetTickerProviderMixin {
  late final TabController tabController;
  final RxInt touchedIndex = 0.obs;

  List orderData = [
    {"title": "25%", "value": 25, "color": "0xff0293ee"},
    {"title": "75%", "value": 75, "color": "0xff13d38e"},
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void setTouchedIndex(int idx) {
    touchedIndex.value = idx;
    update();
  }
}
