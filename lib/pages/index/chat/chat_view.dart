import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('客户消息'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('chat'),
      ),
    );
  }
}
