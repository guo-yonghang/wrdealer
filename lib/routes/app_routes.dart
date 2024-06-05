part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const Index = _Paths.Index;
}

abstract class _Paths {
  _Paths._();
  static const Index = '/';
  static const Login = '/login';
  static const MyselfInfomation = '/myself-infomation';
  static const MyselfQrcode = '/myself-qrcode';
}
