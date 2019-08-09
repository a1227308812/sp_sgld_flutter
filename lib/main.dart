import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sp_sgld_flutter/Utils/ChineseCupertinoLocalizations.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';

import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/6/25 18:09.
 * 描述：项目入口 类似于android的application
 */
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
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp(
        title: '审管联动',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //注册路由表
        routes: NavigatorUtils.router,
        home: LoginPage(),
        //设置国际化范围Material风格和Widgets控件
        localizationsDelegates: [
          //下面两个是Cupertino widgets的delegate, 包含中文
          ChineseCupertinoLocalizations.delegate, // 自定义的delegate
          DefaultCupertinoLocalizations.delegate, // 目前只包含英文
          //下面两个是Material widgets的delegate, 包含中文
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        //设置支持的国际化种类
        supportedLocales: [
          //此处
          const Locale('zh', 'CH'), // China
          const Locale('en', 'US'),
        ],
      ),
    );
  }
}
