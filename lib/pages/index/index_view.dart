import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.tabIndex.value,
          onTap: (int index) {
            controller.pageController.jumpToPage(index);
            controller.setIndex(index);
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: '店铺',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: '资讯',
            ),
            BottomNavigationBarItem(
              icon: Badge.count(
                  count: 9999, child: const Icon(Icons.chat_outlined)),
              label: '消息',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '我的',
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.tabbars,
        ),
      ),
    );
  }
}
