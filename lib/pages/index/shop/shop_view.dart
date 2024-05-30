import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import 'shop_controller.dart';
import '../../../service/keepAliveWrapper.dart';
import '../../../common/staticData.dart';

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
            // ShopEnterWidget(),
            Column(
              children: [
                IncomeWidget(),
                Container(height: 10, color: const Color(0xfff8f8fb)),
                GridUtilWidget(),
                Container(height: 10, color: const Color(0xfff8f8fb)),
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
      width: 360,
      height: 150,
      color: Get.theme.primaryColor,
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Column(
                //左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "今日收入(元)",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '26587.6',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(
                        width: 115,
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
                              '26587.6',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 115,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
            top: 15,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
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
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Text('我的钱包',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                ],
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
      width: 360,
      height: 360 / 2,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: StaticData.indexGrids.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          itemBuilder: (context, i) {
            return SizedBox(
              width: 125,
              height: 80,
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      child: Image.network(
                        StaticData.indexGrids[i]['img'],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Text(
                      StaticData.indexGrids[i]['name'],
                      style: const TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  //待办事项
  Widget TodosWidget(context) {
    return SizedBox(
      width: 360,
      child: Column(
        children: [
          BrnActionCardTitle(
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
          BusiCardWdiget(context),
        ],
      ),
    );
  }

  //商机单卡片
  Widget BusiCardWdiget(context) {
    return Column(
      children: [
        BrnButtonPanel(
          horizontalPadding: 0,
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonNameList: const ['次按钮1', '次按钮2'],
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),
      ],
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
