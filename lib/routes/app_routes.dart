part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const Index = _Paths.Index;
}

abstract class _Paths {
  _Paths._();
  static const Index = '/';
  static const Login = '/login';
}
