import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import 'package:get/get_navigation/get_navigation.dart';
import './admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff4e75fd),
                  Color(0xff1dc3ff),
                ],
              ),
            ),
            child: ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.fromLTRB(16, 5, 10, 5),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg"),
              ),
              title: const Text(
                '逆境生长的店铺',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              subtitle: const Row(
                children: [
                  Icon(Icons.verified_user, color: Color(0xfff0e68c), size: 18),
                  SizedBox(width: 2),
                  Text(
                    '19512111111',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
            child: Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff465cff),
                    Color(0xff6297db),
                    Color(0xff1dc3ff),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "尊享会员权益",
                    style: TextStyle(
                      color: Color(0xfff0e68c),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "查看权益",
                        style: TextStyle(color: Color(0xff465cff)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(color: const Color(0xfff8f8f8), height: 12),
          ...controller.list.map((item) {
            return ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.fromLTRB(16, 2, 10, 2),
              title: Text(item['title']),
              leading: Icon(
                item['icon'],
                color: const Color(0xff303030),
                size: 20,
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black54,
              ),
            );
          }),
        ],
      ),
    );
  }
}
