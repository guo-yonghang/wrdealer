import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './info_controller.dart';

class MyselfInfoView extends GetView<MyselfInfoController> {
  const MyselfInfoView({super.key});
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
