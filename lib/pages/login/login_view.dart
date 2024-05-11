import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      //登录页面手机号验证码登录表单
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              width: double.infinity,
              left: 0,
              top: 0,
              child: Form(child: Text('登录页')),
            ),
          ],
        ),
      ),
    );
  }
}
