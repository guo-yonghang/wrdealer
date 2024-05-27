import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminView'),
        centerTitle: true,
      ),
      body: Center(child: Text("ddd")),
    );
  }
}
