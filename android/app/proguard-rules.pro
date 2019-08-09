#flutter 混淆配置文件

#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

#上述配置只混淆了 Flutter 引擎库，任何其他库（比如 Firebase）需要添加与之对应的规则。