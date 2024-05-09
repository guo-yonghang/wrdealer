import 'package:get/get.dart';

class ChatStoreController extends GetxController {
  final RxList chatList = [].obs;
  final RxList messageList = [].obs;
  final RxString targetId = ''.obs;
  final RxString targetName = ''.obs;

  void changeTarget(String id) {
    targetId.value = id;
    update();
  }
}
