import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './order_controller.dart';
import '../../../service/keepAliveWrapper.dart';
import '../../../service/rpx.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        body: const Center(
          child: Text(
            '上海万润国际酒店用品市场',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
