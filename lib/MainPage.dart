import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_sgld_flutter/utils/NavigatorUtils.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  //强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '审管联动',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: NavigatorUtils.router,
//      home: ,
      home: OKToast(
        position: ToastPosition.bottom,
        child: MaterialApp(
          routes: NavigatorUtils.router,
          home: LoginPage(),
        ),
      ),
    );
  }
}
