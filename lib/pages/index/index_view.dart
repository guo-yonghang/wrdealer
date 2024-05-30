import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './index_controller.dart';
import '../../common/staticData.dart';

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
          items: StaticData.tabbars.map((item) {
            return BottomNavigationBarItem(
              icon: controller.tabIndex.value == item['index']
                  ? item['select_icon']
                  : item['icon'],
              label: item['name'],
            );
          }).toList(),
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
