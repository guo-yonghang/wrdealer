import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// 登陆中间件
class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isLogin = true;
    if (!isLogin && route != 'login') {
      final args = {"redirectRoute": route};
      return RouteSettings(name: '/login', arguments: args);
    }
    return null;
  }

  // redirect -> onPageCalled -> onBindingsStart -> onPageBuildStart -> onPageBuilt -> onPageDispose
}


/* 
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 假设从中间件传来的参数
    final Map<String, String>? arguments = Get.arguments;
    String? redirectRoute = arguments?['redirectRoute'];

    // 这里添加用户登录逻辑
    // 假定登录成功后
    void onLoginSuccess() {
      if (redirectRoute != null) {
        // 如果有重定向路由，则导航至该路由
        Get.toNamed(redirectRoute);
      } else {
        // 否则，导航至默认页面或其他操作
        Get.toNamed('/');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("登录页面"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('登录并跳转'),
          onPressed: onLoginSuccess,
        ),
      ),
    );
  }
}
 */