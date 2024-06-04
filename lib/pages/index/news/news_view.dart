import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import './news_controller.dart';
import '../../../components/loadMore.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return TabBar(
            controller: controller.tabController,
            dividerHeight: 0,
            tabs: controller.tabs.map((item) {
              int count = item['badge'] as int;
              return Badge.count(
                count: count,
                isLabelVisible: count > 0,
                offset: const Offset(10, 2),
                child: Tab(child: Text('${item['title']}')),
              );
            }).toList(),
          );
        }),
      ),
      body: Obx(() {
        return TabBarView(
          controller: controller.tabController,
          children: controller.list.asMap().entries.map((entry) {
            List item = entry.value;
            return RefreshIndicator(
              onRefresh: controller.onRefresh,
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: item.length + 1,
                itemBuilder: (context, index) {
                  if (index == item.length) {
                    return LoadMore(status: controller.loadStatus[entry.key]);
                  }
                  return ListTile(
                    title: Text('$index. ${item[index]['title']}'),
                    subtitle: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item[index]['anthor']),
                            Text('${item[index]['read']}阅读')
                          ],
                        )
                      ],
                    ),
                    leading: Image.network(
                      item[index]['img'],
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    subtitleTextStyle:
                        const TextStyle(color: Colors.black45, fontSize: 13),
                    onTap: () {
                      print('点击了第$index条新闻');
                    },
                  );
                },
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}

/* 
ListView.builder(
                controller: controller.scrollController,
                itemCount: item['list'].length + 1,
                itemBuilder: (context, index) {
                  Map currentNews = item['list'][index];
                  if (index == controller.newsData.length) {
                    return LoadMore(status: item['loadStatus']);
                  }
                  return ListTile(
                    title: Text(currentNews['title']),
                    subtitle: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(currentNews['anthor']),
                            Text('${currentNews['read']}阅读')
                          ],
                        )
                      ],
                    ),
                    leading: Image.network(
                      currentNews['img'],
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    subtitleTextStyle:
                        const TextStyle(color: Colors.black45, fontSize: 13),
                    onTap: () {
                      print('点击了第$index条新闻');
                    },
                  );
                },
              )

 */