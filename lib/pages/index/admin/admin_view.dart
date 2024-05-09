import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './admin_controller.dart';
import '../../../store/chat.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    final ChatStoreController chatStoreController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            'AdminView is working ${chatStoreController.targetId}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
