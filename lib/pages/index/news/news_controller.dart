import 'package:flutter/material.dart';
import 'package:get/get.dart';

List list = [
  {
    "title": "蔚来李斌谈小米华为竞争：冲击不如特斯拉，汽车不是流量导向行业",
    "desc": "",
    "anthor": "腾讯新闻一线",
    "time": "昨天",
    "img":
        "https://inews.gtimg.com/news_ls/O2v4RsYqOPvzxFdxytXu3HdnbGkrfMgeOYyB6BvuvFcWoAA_294195/0",
    "read": 100,
  },
  {
    "title": "智商175有多恐怖？中国人平均105，你智商多高？敢不敢来测一测！",
    "desc": "",
    "anthor": "IQ测试-灵知妙享",
    "time": "10小时前",
    "img":
        "https://pgdt.gtimg.cn/141/20204/snscosdownload/SZ/…5b07fe362a1c9b9a89d3d551735ad3ea9d602baee1ae57412",
    "read": 20,
  },
  {
    "title": "以利润换销量？宝马一季报喜忧参半",
    "desc": "",
    "anthor": "车圈能见度",
    "time": "22小时前",
    "img":
        "https://inews.gtimg.com/om_ls/Oh9CmOjVgO6cgHDkJl8imERKK_-EeuiMOOfIqyKEcBo40AA_294195/0",
    "read": 1,
  },
  {
    "title": "余承东遭“明升暗降”，华为葫芦里卖的什么药？",
    "desc": "",
    "anthor": "融中财经",
    "time": "3小时前",
    "img":
        "https://inews.gtimg.com/om_ls/OyS8GkA-8HdZu39cLYd663pKq6aTQnEa470lmjZmZwsKMAA_294195/0",
    "read": 16,
  },
  {
    "title": "星纪元ET 18.98万起，奇瑞的诚意到位了，哪个版本值得买",
    "desc": "",
    "anthor": "阿喵汽车",
    "time": "6小时前",
    "img":
        "	https://inews.gtimg.com/om_ls/OLWKy1vN_uLFoxSbhTz5odLS40WyyDzP7o4eKay1a3jSUAA_294195/0",
    "read": 4,
  },
  {
    "title": "蔚来李斌谈小米华为竞争：冲击不如特斯拉，汽车不是流量导向行业",
    "desc": "",
    "anthor": "腾讯新闻一线",
    "time": "昨天",
    "img":
        "https://inews.gtimg.com/news_ls/O2v4RsYqOPvzxFdxytXu3HdnbGkrfMgeOYyB6BvuvFcWoAA_294195/0",
    "read": 100,
  },
  {
    "title": "智商175有多恐怖？中国人平均105，你智商多高？敢不敢来测一测！",
    "desc": "",
    "anthor": "IQ测试-灵知妙享",
    "time": "10小时前",
    "img":
        "https://pgdt.gtimg.cn/141/20204/snscosdownload/SZ/…5b07fe362a1c9b9a89d3d551735ad3ea9d602baee1ae57412",
    "read": 20,
  },
  {
    "title": "以利润换销量？宝马一季报喜忧参半",
    "desc": "",
    "anthor": "车圈能见度",
    "time": "22小时前",
    "img":
        "https://inews.gtimg.com/om_ls/Oh9CmOjVgO6cgHDkJl8imERKK_-EeuiMOOfIqyKEcBo40AA_294195/0",
    "read": 1,
  },
  {
    "title": "余承东遭“明升暗降”，华为葫芦里卖的什么药？",
    "desc": "",
    "anthor": "融中财经",
    "time": "3小时前",
    "img":
        "https://inews.gtimg.com/om_ls/OyS8GkA-8HdZu39cLYd663pKq6aTQnEa470lmjZmZwsKMAA_294195/0",
    "read": 16,
  },
  {
    "title": "星纪元ET 18.98万起，奇瑞的诚意到位了，哪个版本值得买",
    "desc": "",
    "anthor": "阿喵汽车",
    "time": "6小时前",
    "img":
        "	https://inews.gtimg.com/om_ls/OLWKy1vN_uLFoxSbhTz5odLS40WyyDzP7o4eKay1a3jSUAA_294195/0",
    "read": 4,
  }
];

class NewsController extends GetxController {
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
