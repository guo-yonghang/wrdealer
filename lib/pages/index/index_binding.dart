import 'package:get/get.dart';
import './index_controller.dart';
import './store/store_controller.dart';
import './chart/chart_controller.dart';
// import './order/order_controller.dart';
import './chat/chat_controller.dart';
import './admin/admin_controller.dart';
import '../../store/chat.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<ChartController>(() => ChartController());
    // Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<AdminController>(() => AdminController());
    Get.lazyPut<ChatStoreController>(() => ChatStoreController());
  }
}
