import 'package:get/get.dart';

class GlobalController extends GetxController {
  Map user = {
    "img": "https://fastly.jsdelivr.net/npm/@vant/assets/sand.jpeg",
    "name": "逆境生长的店铺",
    "phone": "19512111111",
  };

  setUser(Map val) {
    user = val;
  }
}
