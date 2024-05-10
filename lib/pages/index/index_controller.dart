import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './store/store_view.dart';
import './news/news_view.dart';
import './chat/chat_view.dart';
import './admin/admin_view.dart';

class IndexController extends GetxController {
  final RxInt tabIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  final List<Widget> tabbars = [
    const StoreView(),
    const NewsView(),
    const ChatView(),
    const AdminView(),
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

  void setIndex(int idx) {
    tabIndex.value = idx;
    update();
  }
}
