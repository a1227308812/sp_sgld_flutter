import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';
import 'package:sp_sgld_flutter/utils/NavigatorUtils.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';
import 'package:oktoast/oktoast.dart';

import 'CommonConfig.dart';
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
//        home: LoginPage(),
        home: InfiniteListView(
          data: List<String>(10),
          hasSeparator: true,
          firstRefresh: false,
          refreshCallback: () async {
            print('refreshCallback');
          },
          loadMoreCallBack: () async {
            print('loadMoreCallBack');
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.red,
              height: 100,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              height: 30,
            );
          },
          firstRefreshWidget: _getfirstRefreshWidget(context),
        ),
      ),
    );
  }

  _getfirstRefreshWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: Center(
          child: Container(
        color: Color(0xffd9d9d9),
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              child: SpinKitCubeGrid(
                color: Theme.of(context).primaryColor,
                size: 70.0,
              ),
            ),
            Text(
              "数据加载中...",
              style: Config.textStyleDef.apply(color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
