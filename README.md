# wjpdealer

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 运行时权限

permission_handler

```
import 'package:permission_handler/permission_handler.dart';

...

void requestPermission() async {
  var status = await Permission.camera.status;
  if (status.isGranted) {
    // 已有权限，可以进行相关操作。
  } else if (status.isDenied) {
    // 用户拒绝了权限，我们可以请求一次权限。
    if (await Permission.camera.request().isGranted) {
      // 用户授予权限，可以进行相关操作。
    }
    // 用户再次拒绝了权限，可能需要解释为何需要这个权限。
  } else if (status.isPermanentlyDenied) {
    // 权限被永久拒绝，我们无法再次请求权限，需要引导用户去设置中手动开启。
    openAppSettings();
  }
}

...

// 在适当的时候，调用 requestPermission 请求权限
requestPermission();
```
