import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './qrcode_controller.dart';

class MyselfQrcodeView extends GetView<MyselfQrcodeController> {
  const MyselfQrcodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyselfQrcodeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyselfQrcodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
