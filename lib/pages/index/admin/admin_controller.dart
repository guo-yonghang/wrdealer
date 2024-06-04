import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  List list = [
    {
      "title": "我的认证",
      "icon": Icons.verified_user_outlined,
      "size": 20,
    },
    {
      "title": "店铺二维码",
      "icon": Icons.qr_code_outlined,
      "size": 20,
    },
    {
      "title": "意见反馈",
      "icon": Icons.feedback_outlined,
      "size": 20,
    },
    {
      "title": "联系客服",
      "icon": Icons.support_agent_outlined,
      "size": 20,
    },
    {
      "title": "设置",
      "icon": Icons.settings_outlined,
      "size": 20,
    },
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
