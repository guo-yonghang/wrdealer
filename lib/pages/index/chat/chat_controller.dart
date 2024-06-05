import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final RxString loadStatus = 'init'.obs;
  final RxList list = [].obs;
  final RxInt allCount = 0.obs;

  int page = 1;
  bool flag = false;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    getChatList(reload: true);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels > maxScrollExtent - 20 && loadStatus.value != 'final') {
        getChatList(reload: false);
      }
    });
  }

  //获取聊天列表
  Future<void> getChatList({bool reload = false}) async {
    if (flag) return;
    flag = true;
    page++;
    if (reload) {
      page = 1;
      list.clear();
    }
    await Future.delayed(const Duration(seconds: 1));
    List newList = List.generate(15, (index) {
      return {
        "avatar": "https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg",
        "name": "User Friend $index",
        "message": "latest message from user friend $index",
        "count": index % 3
      };
    });
    list.addAll(newList);
    allCount.value =
        list.fold(0, (int sum, item) => sum + item['count'] as int);
    loadStatus.value = page > 3 ? 'final' : 'loading';
    flag = false;
    update();
  }

  //下拉刷新
  Future<void> onRefresh() async {
    loadStatus.value = '';
    await getChatList(reload: true);
  }
}
