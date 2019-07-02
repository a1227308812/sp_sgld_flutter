import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';
import 'package:sp_sgld_flutter/utils/NavigatorUtils.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';
import 'package:oktoast/oktoast.dart';

import 'package:sp_sgld_flutter/Common/config/Config.dart';
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
      ),
    );
  }

}
