import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import '../../../common/staticData.dart';

class NewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final tabIndex = 0.obs;
  final RxList list = [[], []].obs;
  final RxList loadStatus = ['init', 'init'].obs;

  List page = [1, 1];
  List flag = [false, false];

  final RxList tabs = [
    {
      "title": "万润国际",
      "badge": 0,
    },
    {
      "title": "行业动态",
      "badge": 2,
    }
  ].obs;

  ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    scrollListener();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(tabSelection);
    getNewsList(reload: true);
  }

  @override
  void onClose() {
    scrollController.dispose();
    tabController.removeListener(tabSelection);
    tabController.dispose();
    super.onClose();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels > maxScrollExtent - 20 &&
          loadStatus[tabIndex.value] != 'final') {
        getNewsList(reload: false);
      }
    });
  }

  //监听tab
  void tabSelection() {
    tabIndex.value = tabController.index;
    update();
    if (list[tabIndex.value].length == 0) {
      getNewsList();
    }
  }

  //获取新闻列表
  Future<void> getNewsList({bool reload = false}) async {
    if (flag[tabIndex.value]) return;
    flag[tabIndex.value] = true;
    page[tabIndex.value]++;
    if (reload) {
      page[tabIndex.value] = 1;
      list[tabIndex.value] = [];
    }
    await Future.delayed(const Duration(seconds: 1));
    list[tabIndex.value] = list[tabIndex.value] + StaticData.newsMockList;
    flag[tabIndex.value] = false;
    loadStatus[tabIndex.value] = page[tabIndex.value] > 3 ? 'final' : 'loading';
    update();
  }

  //下拉刷新
  Future<void> onRefresh() async {
    loadStatus[tabIndex.value] = '';
    await getNewsList(reload: true);
  }
}
