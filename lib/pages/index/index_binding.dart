import 'package:get/get.dart';
import './index_controller.dart';
import './shop/shop_controller.dart';
import './news/news_controller.dart';
import './chat/chat_controller.dart';
import './admin/admin_controller.dart';
import '../../store/chat.dart';
import '../../store/user.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<ShopController>(() => ShopController());
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<AdminController>(() => AdminController());
    Get.lazyPut<ChatStoreController>(() => ChatStoreController());
    Get.lazyPut<UserStoreController>(() => UserStoreController());
  }
}
