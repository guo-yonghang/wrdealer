import 'package:get/get.dart';
import './middlewares.dart';

import '../pages/index/index_view.dart';
import '../pages/index/index_binding.dart';
import '../pages/login/login_view.dart';
import '../pages/login/login_binding.dart';

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
    )
  ];
}
