import 'package:get/get.dart';
import './middlewares.dart';
import '../pages/index/index_view.dart';
import '../pages/index/index_binding.dart';
import '../pages/login/login_view.dart';
import '../pages/login/login_binding.dart';

//我的模块
import '../pages/myself/infomation/infomation_view.dart';
import '../pages/myself/infomation/infomation_binding.dart';
import '../pages/myself/qrcode/qrcode_view.dart';
import '../pages/myself/qrcode/qrcode_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Index;

  static final routes = [
    GetPage(
      name: _Paths.Index,
      page: () => const IndexView(),
      binding: IndexBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: _Paths.Login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MyselfInfomation,
      page: () => const MyselfInfomationView(),
      binding: MyselfInfomationBinding(),
    ),
    GetPage(
      name: _Paths.MyselfQrcode,
      page: () => const MyselfQrcodeView(),
      binding: MyselfQrcodeBinding(),
    )
  ];
}
