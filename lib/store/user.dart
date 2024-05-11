import 'package:get/get.dart';

class UserStoreController extends GetxController {
  final RxMap user = {
    // "id": "109",
    // "name": "张三",
    // "avatar": "https://img.yzcdn.cn/vant/cat.jpeg",
    // "phone": "18888888888",
  }.obs;

  void setUser(Map value) {
    user.value = value;
    update();
  }
}
