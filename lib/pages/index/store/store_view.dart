import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrdealer/service/rpx.dart';
import './store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});

  // 顶部收入组件
  Widget IncomeWidget() {
    return Container(
      margin: EdgeInsets.only(top: Rpx.h(10)),
      width: Rpx.w(700),
      height: Rpx.w(324),
      color: Get.theme.primaryColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(left: Rpx.w(40), top: Rpx.h(40)),
              child: Column(
                //左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "今日收入(元)",
                    style: TextStyle(color: Colors.white, fontSize: Rpx.sp(26)),
                  ),
                  SizedBox(height: Rpx.h(10)),
                  Text(
                    '26587.6',
                    style: TextStyle(color: Colors.white, fontSize: Rpx.sp(52)),
                  ),
                  SizedBox(height: Rpx.h(20)),
                  Row(
                    children: [
                      SizedBox(
                        width: Rpx.w(220),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '今日接单',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: Rpx.sp(24)),
                            ),
                            SizedBox(height: Rpx.h(8)),
                            Text(
                              '26587.6',
                              style: TextStyle(
                                  color: Colors.white, fontSize: Rpx.sp(34)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Rpx.w(220),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '昨日新增客户',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: Rpx.sp(24)),
                            ),
                            SizedBox(height: Rpx.h(8)),
                            Text(
                              '81',
                              style: TextStyle(
                                  color: Colors.white, fontSize: Rpx.sp(34)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Rpx.w(220),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7日订单量',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: Rpx.sp(24)),
                            ),
                            SizedBox(height: Rpx.h(8)),
                            Text(
                              '77',
                              style: TextStyle(
                                  color: Colors.white, fontSize: Rpx.sp(34)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Rpx.h(40),
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Rpx.w(20)),
              height: Rpx.h(60),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(Rpx.w(30)),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: Rpx.sp(30),
                  ),
                  SizedBox(width: Rpx.w(10)),
                  Text(
                    '我的钱包',
                    style: TextStyle(color: Colors.white, fontSize: Rpx.sp(26)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 待办数量
  Widget WaitNumWidget() {
    return Container(
      margin: EdgeInsets.only(top: Rpx.h(40)),
      padding: EdgeInsets.symmetric(vertical: Rpx.w(10)),
      width: Rpx.w(700),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.16),
            spreadRadius: Rpx.w(5),
            blurRadius: Rpx.w(5),
            offset: Offset(0, Rpx.w(5)),
          ),
        ],
      ),
      child: Flex(direction: Axis.horizontal, children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '12',
                style: TextStyle(fontSize: Rpx.sp(36)),
              ),
              Text(
                '待报价',
                style: TextStyle(fontSize: Rpx.sp(24), color: Colors.black87),
              ),
            ],
          ),
        ),
        Container(
          width: Rpx.w(1),
          height: Rpx.h(80),
          color: Colors.black12,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '12',
                style: TextStyle(fontSize: Rpx.sp(36)),
              ),
              Text(
                '待发货',
                style: TextStyle(fontSize: Rpx.sp(24), color: Colors.black87),
              ),
            ],
          ),
        ),
        Container(
          width: Rpx.w(1),
          height: Rpx.h(80),
          color: Colors.black12,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '3',
                style: TextStyle(fontSize: Rpx.sp(36)),
              ),
              Text(
                '待回复',
                style: TextStyle(fontSize: Rpx.sp(24), color: Colors.black87),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  // 工作台
  Widget WorkbenchWidget() {
    return Container(
      margin: EdgeInsets.only(left: Rpx.w(0), top: Rpx.h(40)),
      width: Rpx.w(750),
      height: Rpx.w(345),
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: Rpx.w(20),
        ),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              print('点击了第$i个');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings_applications_outlined,
                  size: Rpx.sp(120),
                ),
                // SizedBox(height: Rpx.h(10)),
                Text(
                  '工作台',
                  style: TextStyle(fontSize: Rpx.sp(24), color: Colors.black87),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 待办事项
  Widget TodoListWidget() {
    return Container(
        margin: EdgeInsets.only(top: Rpx.h(40)),
        padding: EdgeInsets.symmetric(vertical: Rpx.w(10)),
        width: Rpx.w(700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '待办事项',
                  style: TextStyle(
                    fontSize: Rpx.sp(30),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '查看全部',
                    style: TextStyle(fontSize: Rpx.sp(24), color: Colors.blue),
                  ),
                )
              ],
            ),
            SizedBox(height: Rpx.h(20)),
            const Column(
              children: [
                Text("一条"),
                Text("一条"),
                Text("一条"),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            //头像宽高30并且使用网络图片
            SizedBox(
              width: 36,
              child: ClipOval(
                child: Image.network(
                  'https://jpf.jpwanrun.com/upload/file/2023-09-25/7bczzgtyzw.jpg',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              flex: 1,
              child: Text(
                '上海有一家专业公司总经小学网最高的专业人员同学',
                style: TextStyle(fontSize: 18, color: Colors.black87),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      //可滚动的页面
      body: SingleChildScrollView(
        child: Column(
          children: [
            IncomeWidget(),
            WaitNumWidget(),
            WorkbenchWidget(),
            TodoListWidget(),
          ],
        ),
      ),
    );
  }
}
