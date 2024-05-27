import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final RxInt index = 0.obs;

  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getChatList(bool reload) async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}
