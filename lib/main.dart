import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';
import 'routes/app_pages.dart';
import 'service/brnConfigUtils.dart';

void main() {
  BrnInitializer.register(
    allThemeConfig:
        BrnAllThemeConfig(commonConfig: brnConfigUtils.defaultCommonConfig),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: Colors.transparent,
    // systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "玖品商家",
      theme: ThemeData(
        primaryColor: const Color(0xff4e75fd),
        colorScheme: const ColorScheme.light(primary: Color(0xff4e75fd)),
      ),
      defaultTransition: Transition.rightToLeft,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
