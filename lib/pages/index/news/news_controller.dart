import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';

List list = [
  {
    "title": "蔚来李斌谈小米华为竞争：冲击不如特斯拉，汽车不是流量导向行业",
    "desc": "",
    "anthor": "腾讯新闻一线",
    "time": "昨天",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/909dd02b-3ab6-4c94-92f0-d81daba88a9f.jpg",
    "read": 100,
  },
  {
    "title": "智商175有多恐怖？中国人平均105，你智商多高？敢不敢来测一测！",
    "desc": "",
    "anthor": "IQ测试-灵知妙享",
    "time": "10小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/0ae032b9-e56a-4868-8f6a-468e44dc8582.jpg",
    "read": 20,
  },
  {
    "title": "以利润换销量？宝马一季报喜忧参半",
    "desc": "",
    "anthor": "车圈能见度",
    "time": "22小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/ae52cf3a-4f38-46e2-8b2f-11a295b2eaea.jpg",
    "read": 1,
  },
  {
    "title": "余承东遭“明升暗降”，华为葫芦里卖的什么药？",
    "desc": "",
    "anthor": "融中财经",
    "time": "3小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/c75d0033-5bde-408a-93f0-82297cd4f6e5.jpg",
    "read": 16,
  },
  {
    "title": "星纪元ET 18.98万起，奇瑞的诚意到位了，哪个版本值得买",
    "desc": "",
    "anthor": "阿喵汽车",
    "time": "6小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/05b83b3a-1513-4151-b9eb-04a5a79b2d68.jpg",
    "read": 4,
  },
  {
    "title": "蔚来李斌谈小米华为竞争：冲击不如特斯拉，汽车不是流量导向行业",
    "desc": "",
    "anthor": "腾讯新闻一线",
    "time": "昨天",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/909dd02b-3ab6-4c94-92f0-d81daba88a9f.jpg",
    "read": 100,
  },
  {
    "title": "智商175有多恐怖？中国人平均105，你智商多高？敢不敢来测一测！",
    "desc": "",
    "anthor": "IQ测试-灵知妙享",
    "time": "10小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/0ae032b9-e56a-4868-8f6a-468e44dc8582.jpg",
    "read": 20,
  },
  {
    "title": "以利润换销量？宝马一季报喜忧参半",
    "desc": "",
    "anthor": "车圈能见度",
    "time": "22小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/ae52cf3a-4f38-46e2-8b2f-11a295b2eaea.jpg",
    "read": 1,
  },
  {
    "title": "余承东遭“明升暗降”，华为葫芦里卖的什么药？",
    "desc": "",
    "anthor": "融中财经",
    "time": "3小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/c75d0033-5bde-408a-93f0-82297cd4f6e5.jpg",
    "read": 16,
  },
  {
    "title": "星纪元ET 18.98万起，奇瑞的诚意到位了，哪个版本值得买",
    "desc": "",
    "anthor": "阿喵汽车",
    "time": "6小时前",
    "img":
        "http://jpf.jpwanrun.com/upload/wrgj/news/05b83b3a-1513-4151-b9eb-04a5a79b2d68.jpg",
    "read": 4,
  },
];

class NewsController extends GetxController {
  final tabIndex = 0.obs;
  final tabLIst = [
    {
      "title": "万润国际",
      "badge": 0,
    },
    {
      "title": "行业动态",
      "badge": 2,
    }
  ].obs;
  final RxList newsList = [].obs;
  final RxBool completed = false.obs;
  int page = 1;
  bool apiloading = false;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getNewsList(true);
    scrollListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //监听滚动
  void scrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels > maxScrollExtent - 20 && !completed.value) {
        page++;
        getNewsList(false);
      }
    });
  }

  //获取新闻列表
  Future<void> getNewsList(bool reload) async {
    if (apiloading) return;
    apiloading = true;
    if (reload) {
      page = 1;
    }
    await Future.delayed(const Duration(seconds: 1));
    if (reload) {
      newsList.clear();
    }
    newsList.addAll(list);
    apiloading = false;
    completed.value = page > 3;
    update();
  }
}
