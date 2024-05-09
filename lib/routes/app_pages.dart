import 'package:get/get.dart';

import '../pages/index/index_view.dart';

import '../pages/index/index_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Index;

  static final routes = [
    GetPage(
      name: _Paths.Index,
      page: () => const IndexView(),
      binding: IndexBinding(),
    ),
  ];
}
