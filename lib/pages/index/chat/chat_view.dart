import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './chat_controller.dart';
import '../../../components//loadMore.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '客户消息',
                style: TextStyle(fontSize: 18),
              ),
              controller.allCount > 0
                  ? Text(
                      ' (${controller.allCount})',
                      style: const TextStyle(fontSize: 15),
                    )
                  : Container(),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.list.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.list.length) {
                return LoadMore(status: controller.loadStatus.value);
              }
              Map currentChat = controller.list[index];
              return ListTile(
                onTap: () {},
                title: Text(
                  currentChat['name'],
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                subtitle: Text(
                  currentChat['message'],
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                  overflow: TextOverflow.ellipsis,
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(currentChat['avatar']),
                ),
                trailing: Badge.count(
                  count: currentChat['count'],
                  isLabelVisible: currentChat['count'] > 0,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
