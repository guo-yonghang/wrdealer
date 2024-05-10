import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './chart_controller.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({super.key});

  //订单数据
  Widget OrderChartWidget() {
    return PieChart(
      swapAnimationDuration: const Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 50,
        pieTouchData:
            PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
          if (!event.isInterestedForInteractions ||
              pieTouchResponse == null ||
              pieTouchResponse.touchedSection == null) {
            controller.setTouchedIndex(-1);
            return;
          }
          controller.setTouchedIndex(
              pieTouchResponse.touchedSection!.touchedSectionIndex);
        }),
        sections: controller.orderData.map((e) {
          return PieChartSectionData(
            value: e['value'].toDouble(),
            color: Color(int.parse(e['color'])),
            title: e['title'],
            radius: 100,
            showTitle: true,
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(
              text: "订单数据",
            ),
            Tab(
              text: "收入数据",
            ),
            Tab(
              text: "收入数据",
            ),
          ],
        ),
      ),
      //顶部tabbar吸顶内容可滚动
      body: TabBarView(
        controller: controller.tabController,
        children: <Widget>[
          OrderChartWidget(),
          const Center(
            child: Text("It's rainy here"),
          ),
          const Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
