import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wrdealer/service/keepAliveWrapper.dart';
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
                    style: TextStyle(color: Colors.white, fontSize: Rpx.sp(56)),
                  ),
                  SizedBox(height: Rpx.h(30)),
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
              padding: EdgeInsets.symmetric(
                  vertical: Rpx.h(5), horizontal: Rpx.w(20)),
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
                '7',
                style: TextStyle(fontSize: Rpx.sp(36)),
              ),
              Text(
                '待付款',
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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.workList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: Rpx.w(20),
        ),
        itemBuilder: (context, i) {
          int count = controller.workList[i]['count'];
          bool isLabelVisible = count > 0;
          String name = controller.workList[i]['name'];
          return InkWell(
            onTap: () {
              print('点击了第$i个');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge.count(
                  count: count,
                  isLabelVisible: isLabelVisible,
                  offset: Offset(Rpx.w(-10), Rpx.h(5)),
                  child: Icon(
                    Icons.settings_applications_outlined,
                    size: Rpx.sp(120),
                    color: Get.theme.primaryColor,
                  ),
                ),
                Text(
                  name,
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
        margin: EdgeInsets.only(top: Rpx.h(10)),
        padding: EdgeInsets.symmetric(vertical: Rpx.w(10)),
        width: Rpx.w(700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              leading: Text(
                "待办事项(30)",
                style: TextStyle(
                  fontSize: Rpx.sp(30),
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: SizedBox(
                width: Rpx.w(200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '查看全部',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: Rpx.sp(26),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: Rpx.sp(30),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Rpx.h(20)),
            Column(
              children: [
                const OrderCard(),
                SizedBox(height: Rpx.h(30)),
                const BusinessCard(),
                SizedBox(height: Rpx.h(30)),
                const BusinessCard(),
                SizedBox(height: Rpx.h(30)),
                const BusinessCard(),
                SizedBox(height: Rpx.h(30)),
                const BusinessCard(),
                SizedBox(height: Rpx.h(30)),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
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
        body: ListView(
          children: [
            Column(
              children: [
                IncomeWidget(),
                // WaitNumWidget(),
                WorkbenchWidget(),
                TodoListWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//商机单卡片组件
class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Rpx.h(20),
        horizontal: Rpx.w(20),
      ),
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
      child: Column(
        children: [
          ListTile(
            title: Text(
              '青花瓷定制高端餐具1000套+精致密胺餐具1000套 JP_992256',
              style:
                  TextStyle(fontSize: Rpx.sp(30), fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '询货总数：30',
                  style: TextStyle(fontSize: Rpx.sp(26), color: Colors.black87),
                ),
                Text(
                  '发布时间：2021-09-25 13:35:25',
                  style: TextStyle(fontSize: Rpx.sp(26), color: Colors.black87),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  //设置宽高
                  minimumSize: WidgetStateProperty.all(
                    Size(Rpx.w(150), Rpx.h(75)),
                  ),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: Text(
                  '报价',
                  style: TextStyle(
                    fontSize: Rpx.sp(26),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//订单卡片组件包含发货按钮
class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Rpx.h(20),
        horizontal: Rpx.w(20),
      ),
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: Rpx.h(20)),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: Rpx.w(1),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '北京智者天下科技有限公司',
                    style: TextStyle(
                      fontSize: Rpx.sp(26),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  '待发货',
                  style: TextStyle(
                    fontSize: Rpx.sp(26),
                    color: Get.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://jpf.jpwanrun.com/upload/file/2023-09-25/7bczzgtyzw.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              '新人专享·高端瓷器佳能相机套装 米饭面碗盘子套装',
              style:
                  TextStyle(fontSize: Rpx.sp(30), fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7英寸黑色',
                  style: TextStyle(fontSize: Rpx.sp(26), color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '￥30',
                      style: TextStyle(
                          fontSize: Rpx.sp(26), color: Colors.red[600]),
                    ),
                    Text(
                      'X10',
                      style: TextStyle(
                          fontSize: Rpx.sp(26), color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://jpf.jpwanrun.com/upload/file/2023-09-25/7bczzgtyzw.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              '新人专享·高端瓷器佳能相机套装 米饭面碗盘子套装',
              style:
                  TextStyle(fontSize: Rpx.sp(30), fontWeight: FontWeight.w500),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7英寸黑色',
                  style: TextStyle(fontSize: Rpx.sp(26), color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '￥30',
                      style: TextStyle(
                          fontSize: Rpx.sp(26), color: Colors.red[600]),
                    ),
                    Text(
                      'X10',
                      style: TextStyle(
                          fontSize: Rpx.sp(26), color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("总金额", style: TextStyle(fontSize: Rpx.sp(30))),
              Text("￥600",
                  style:
                      TextStyle(fontSize: Rpx.sp(30), color: Colors.red[600])),
            ],
          ),
          SizedBox(height: Rpx.h(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                  //设置宽高
                  minimumSize: WidgetStateProperty.all(
                    Size(Rpx.w(150), Rpx.h(75)),
                  ),
                  shape: WidgetStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: Text(
                  '发货',
                  style: TextStyle(
                    fontSize: Rpx.sp(26),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
