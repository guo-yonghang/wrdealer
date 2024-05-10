import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ButtonType { primary, warning, danger, success, info, defaultButton }

class Button extends StatefulWidget {
  //必传参数label及点击事件
  const Button({super.key});

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('按钮'),
      ),
    );
  }
}
