import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './chat_controller.dart';
import 'package:wrdealer/service/rpx.dart';
import '../../../components/load_more.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('客户消息'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.chatStoreController.chatList.isEmpty
            ? const LoadMore()
            : RefreshIndicator(
                onRefresh: () {
                  return controller.getChatList(true);
                },
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.chatStoreController.chatList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            controller.chatStoreController.chatList[index]
                                ['title'],
                            style: TextStyle(
                                fontSize: Rpx.sp(32),
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${controller.chatStoreController.chatList[index]['anthor']} ${controller.chatStoreController.chatList[index]['time']}',
                                style: TextStyle(
                                    fontSize: Rpx.sp(26), color: Colors.grey),
                              ),
                              SizedBox(
                                width: Rpx.w(200),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${controller.chatStoreController.chatList[index]['read']}',
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
                              controller.chatStoreController.chatList[index]
                                  ['img'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {},
                        ),
                        SizedBox(height: Rpx.h(25)),
                      ],
                    );
                  },
                )),
      ),
    );
  }
}
