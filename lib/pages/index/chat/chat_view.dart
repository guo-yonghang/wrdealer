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
        title: const Text('客户消息'),
        centerTitle: true,
      ),
      body: LoadMore(
        status: controller.loadStatus.value,
        initText: '消息加载中...',
        loadText: '加载更多消息...',
        finalText: '没有更多消息了',
      ),
    );
  }
}
