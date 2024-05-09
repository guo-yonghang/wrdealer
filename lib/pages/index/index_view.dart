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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              label: '店铺',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined),
              label: '统计',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.assignment_outlined),
            //   label: '订单管理',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: '消息',
            ),
            BottomNavigationBarItem(
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
