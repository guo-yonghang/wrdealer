import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrdealer/service/storage.dart';
import '../../store/user.dart';
import './shop/shop_view.dart';
import './news/news_view.dart';
import './chat/chat_view.dart';
import './admin/admin_view.dart';

class IndexController extends GetxController {
  final RxInt tabIndex = 2.obs;
  PageController pageController = PageController(initialPage: 2);
  final List<Widget> tabbars = [
    const ShopView(),
    const NewsView(),
    const ChatView(),
    const AdminView(),
  ];
  late UserStoreController userStoreController =
      Get.find<UserStoreController>();

  @override
  void onInit() async {
    super.onInit();
    // await Storage.setData('user', {
    //   "id": "109",
    //   "name": "张三",
    //   "avatar": "https://img.yzcdn.cn/vant/cat.jpeg",
    //   "phone": "18888888888",
    // });
    var value = await Storage.getData('user');
    if (value != null) {
      userStoreController.setUser(value);
    }
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
