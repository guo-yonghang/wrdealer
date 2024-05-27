import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('行业资讯'),
          centerTitle: true,
        ),
        body: Center(
          child: Text("news"),
        ));
  }
}
