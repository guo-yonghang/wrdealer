import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrdealer/service/rpx.dart';
import './news_controller.dart';
import '../../../components/load_more.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('行业资讯'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.newsList.isEmpty
            ? const LoadMore()
            : RefreshIndicator(
                onRefresh: () {
                  return controller.getNewsList(true);
                },
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.newsList[index]['title'],
                            style: TextStyle(
                                fontSize: Rpx.sp(32),
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${controller.newsList[index]['anthor']} ${controller.newsList[index]['time']}',
                                style: TextStyle(
                                    fontSize: Rpx.sp(26), color: Colors.grey),
                              ),
                              SizedBox(
                                width: Rpx.w(200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.newsList[index]['read']}',
                                      style: TextStyle(
                                          fontSize: Rpx.sp(24),
                                          color: Colors.grey),
                                    ),
                                    SizedBox(width: Rpx.w(4)),
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: Rpx.sp(26),
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          leading: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.network(
                              controller.newsList[index]['img'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {},
                        ),
                        index == controller.newsList.length - 1
                            ? LoadMore(
                                completed: controller.completed.value,
                                text: '',
                              )
                            : const SizedBox(),
                        SizedBox(height: Rpx.h(25)),
                      ],
                    );
                  },
                )),
      ),
    );
  }
}
