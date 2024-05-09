import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './chat_controller.dart';
import '../../../store/chat.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    final ChatStoreController chatStoreController = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChatView'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
            () => Text(
              'ChatView is working ${chatStoreController.targetId}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            chatStoreController.changeTarget('999');
          },
          child: const Icon(Icons.add),
        ));
  }
}
