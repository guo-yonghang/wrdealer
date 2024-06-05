import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infomation_controller.dart';

class MyselfInfomationView extends GetView<MyselfInfomationController> {
  const MyselfInfomationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyselfInfomationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyselfInfomationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
