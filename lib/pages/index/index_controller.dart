import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './shop/shop_view.dart';
import './news/news_view.dart';
import './chat/chat_view.dart';
import './admin/admin_view.dart';
// import '../../service/storage.dart';

class IndexController extends GetxController {
  final RxInt tabIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  final List<Widget> tabbars = [
    const ShopView(),
    const NewsView(),
    const ChatView(),
    const AdminView(),
  ];

  @override
  void onInit() async {
    super.onInit();
    // await Storage.setData('user', {
    //   "id": "109",
    //   "name": "张三",
    //   "avatar": "https://img.yzcdn.cn/vant/cat.jpeg",
    //   "phone": "18888888888",
    // });
    // var value = await Storage.getData('user');
    // if (value != null) {
    //   userStoreController.setUser(value);
    // }
  }

  void setIndex(int idx) {
    tabIndex.value = idx;
    update();
  }
}
