import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import 'shop_controller.dart';
import '../../../service/keepAliveWrapper.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 36,
                child: ClipOval(
                  child: Image.network(
                    controller.globalStore.user['img'],
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Text(
                  '${controller.globalStore.user['name']}',
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.qr_code_outlined),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            // ShopEnterWidget(),
            Column(
              children: [
                IncomeWidget(),
                Container(height: 2, color: const Color(0xfff8f8fb)),
                GridUtilWidget(),
                Container(height: 2, color: const Color(0xfff8f8fb)),
                TodosWidget(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  //数据卡片
  Widget IncomeWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: 350,
      height: 180,
      color: Get.theme.primaryColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                //左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "今日收入(元)",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '26587.6',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '今日接单',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '20',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          width: 115,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '昨日新增客户',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '81',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7日订单量',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '77',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 0,
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text('我的钱包',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //常用工具
  Widget GridUtilWidget() {
    return SizedBox(
      width: 350,
      height: 350 / 2,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.indexGrids.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge.count(
                    count: controller.indexGrids[i]['count'],
                    isLabelVisible: controller.indexGrids[i]['count'] > 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      child: Image.network(
                        controller.indexGrids[i]['img'],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Text(
                    controller.indexGrids[i]['name'],
                    style: const TextStyle(fontSize: 13),
                  )
                ],
              ),
            );
          }),
    );
  }

  //待办事项
  Widget TodosWidget(context) {
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: BrnActionCardTitle(
              title: '待办事项',
              subTitle: '10',
              accessoryText: '查看更多',
              themeData: BrnCardTitleConfig(
                accessoryTextStyle: BrnTextStyle(fontSize: 12),
              ),
              onTap: () {
                BrnToast.show('BrnActionCardTitle is clicked', context);
              },
            ),
          ),
          BusiCardWdiget(context),
          DefaultOrderCardWidget(context),
          PointOrderCardWidget(context),
          ApptCardWidget(context),
          BusiCardWdiget(context),
        ],
      ),
    );
  }

  //商机单卡片
  Widget BusiCardWdiget(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x204e75fd))),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text('电子询货单-玖品信息发布平台玖品信息发布平台玖品信息发布平台-JP2024053199'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('询货总数：30'),
                Text('发布时间：2021-09-25 12:00'),
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
            subtitleTextStyle: const TextStyle(color: Colors.black54),
            contentPadding: const EdgeInsets.all(10),
            onTap: () {
              BrnToast.show('商机单 is clicked', context);
            },
          ),
          BrnButtonPanel(
            horizontalPadding: 10,
            mainButtonName: '报价',
            mainButtonOnTap: () {
              BrnToast.show('报价', context);
            },
            secondaryButtonNameList: const ['联系'],
            secondaryButtonOnTap: (index) {
              BrnToast.show('第$index个次按钮点击了', context);
            },
          ),
        ],
      ),
    );
  }

  //订单卡片
  Widget DefaultOrderCardWidget(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x204e75fd))),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              'https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: const Text('新人专享.新版规格商品高端定制水杯青花瓷国瓷套装定制色'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10寸黑色套装'),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '￥19',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text('x1')
                  ],
                ),
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
            subtitleTextStyle: const TextStyle(color: Colors.black54),
            contentPadding: const EdgeInsets.all(10),
            onTap: () {
              BrnToast.show('订单 is clicked', context);
            },
          ),
          ListTile(
            leading: Image.network(
              'https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: const Text('新人专享.新版规格商品高端定制水杯青花瓷国瓷套装定制色'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10寸黑色套装'),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '￥19',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text('x1')
                  ],
                ),
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
            subtitleTextStyle: const TextStyle(color: Colors.black54),
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            onTap: () {
              BrnToast.show('订单 is clicked', context);
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            margin: const EdgeInsets.only(bottom: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('总金额'),
                Text('￥38', style: TextStyle(color: Colors.red))
              ],
            ),
          ),
          BrnButtonPanel(
            horizontalPadding: 10,
            mainButtonName: '发货',
            mainButtonOnTap: () {
              BrnToast.show('发货', context);
            },
            secondaryButtonNameList: const ['联系', '查看买家'],
            secondaryButtonOnTap: (index) {
              BrnToast.show('第$index个次按钮点击了', context);
            },
          ),
        ],
      ),
    );
  }

  //积分订单卡片
  Widget PointOrderCardWidget(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x204e75fd))),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              'https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: const Text('积分兑换.漂亮商务水杯'),
            subtitle: const Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '19积分',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text('x1')
                  ],
                )
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
            subtitleTextStyle: const TextStyle(color: Colors.black54),
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            onTap: () {
              BrnToast.show('积分订单 is clicked', context);
            },
          ),
          BrnButtonPanel(
            horizontalPadding: 10,
            mainButtonName: '发货/备货',
            mainButtonOnTap: () {
              BrnToast.show('发货/备货', context);
            },
            secondaryButtonNameList: const ['联系'],
            secondaryButtonOnTap: (index) {
              BrnToast.show('第$index个次按钮点击了', context);
            },
          ),
        ],
      ),
    );
  }

  //预约单卡片组件
  Widget ApptCardWidget(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x204e75fd))),
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text('预约人郭先生-预约目的采购'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('预约时间：2021-09-25 13时~15时'),
                Text('备注：采购一批商品到店里先看看'),
              ],
            ),
            titleTextStyle: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
            subtitleTextStyle: const TextStyle(color: Colors.black54),
            contentPadding: const EdgeInsets.all(10),
            onTap: () {
              BrnToast.show('预约单 is clicked', context);
            },
          ),
          BrnButtonPanel(
            horizontalPadding: 10,
            mainButtonName: '已到店',
            mainButtonOnTap: () {
              BrnToast.show('已到店', context);
            },
            secondaryButtonNameList: const ['谢绝预约'],
            secondaryButtonOnTap: (index) {
              BrnToast.show('第$index个次按钮点击了', context);
            },
          ),
        ],
      ),
    );
  }

  //商户入驻组件
  Widget ShopEnterWidget() {
    return Column(
      children: [
        InfoStepWidget(),
        AcctStepWidget(),
      ],
    );
  }

  //完善资料步骤条
  Widget InfoStepWidget() {
    return Column(
      children: [
        const BrnCommonCardTitle(
          title: '完善资料',
          padding: EdgeInsets.only(left: 20, top: 20),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 20, left: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.infoStepList.length,
          itemBuilder: (context, index) {
            return BrnStepLine(
              lineWidth: 2,
              isGrey: index != 0,
              lineColor: const Color(0xffeeeeee),
              contentWidget: Container(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      controller.infoStepList[index]['name'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    controller.infoStepList.length - 1 == index
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: BrnSmallMainButton(
                              title: controller.infoStepList[index]['btnText'],
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              onTap: () {
                                BrnToast.show(
                                    controller.infoStepList[index]['name'],
                                    context);
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  //账薄开户步骤条
  Widget AcctStepWidget() {
    return Column(
      children: [
        const BrnCommonCardTitle(
          title: '账薄开户',
          padding: EdgeInsets.only(left: 20, top: 20),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 20, left: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.acctStepList.length,
          itemBuilder: (context, index) {
            return BrnStepLine(
              lineWidth: 1,
              //非第一个是灰色
              isGrey: index != 0,
              //最后一个的线条为透明色 做到不显示的效果
              lineColor: const Color(0xffeeeeee),
              contentWidget: Container(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      controller.acctStepList[index]['name'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    controller.acctStepList.length - 1 == index
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: BrnSmallMainButton(
                              title: controller.acctStepList[index]['btnText'],
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              onTap: () {
                                BrnToast.show(
                                    controller.acctStepList[index]['name'],
                                    context);
                              },
                            ),
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
