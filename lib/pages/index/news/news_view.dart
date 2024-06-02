import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import './news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: TabBar(
              dividerHeight: 0,
              tabs: controller.tabLIst.map((item) {
                int count = item['badge'] as int;
                return Badge.count(
                  count: count,
                  isLabelVisible: count > 0,
                  offset: const Offset(10, 2),
                  child: Tab(child: Text('${item['title']}')),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: controller.tabLIst.map((item) {
              return ListView.builder(
                itemCount: controller.newsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.newsList[index]['title']),
                    subtitle: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.newsList[index]['anthor']),
                            Text('${controller.newsList[index]['read']}阅读')
                          ],
                        )
                      ],
                    ),
                    leading: Image.network(
                      controller.newsList[index]['img'],
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
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
