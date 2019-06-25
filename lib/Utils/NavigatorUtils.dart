import 'package:flutter/cupertino.dart';
import 'package:sp_sgld_flutter/Pages/ChangePaswordPage.dart';
import 'package:sp_sgld_flutter/Pages/HomePage.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';

import 'package:sp_sgld_flutter/Pages/ItemClaimPage.dart';
import 'package:sp_sgld_flutter/Pages/RegulatoryInformationEntryPage.dart';
/**
 * Created by ZWP on 2019/6/20 18:17.
 * 描述：路由工具类
 */
class NavigatorUtils {
  static String loginPageKey = '/login';
  static String homePageKey = '/home';
  static String changePasswordPageKey = '/forgetPassword';
  //事项认领页面
  static String itemClaimPageKey = '/itemClaim';
  //监管信息录入
  static String regulatoryInformationEntryPageKey = '/regulatoryInformationEntry';
  //整改信息录入
  static String rectificationInformationEntryPageKey = '/rectificationInformationEntry';
  //综合查询
  static String integratedQueryPageKey = '/integratedQuery';

  static Map<String, WidgetBuilder> router = {
    //注册登录页面路由
    loginPageKey: (context) => LoginPage(),
    homePageKey: (context) => HomePage(),
    changePasswordPageKey: (context) => ChangePassword(),

    itemClaimPageKey: (context) => ItemCliamPage(),
    regulatoryInformationEntryPageKey: (context) => RegulatoryInformationEntryPage(),
    rectificationInformationEntryPageKey: (context) => ChangePassword(),
    integratedQueryPageKey: (context) => ChangePassword(),
  };

  //静态跳转
  static navigatorRouterByName(BuildContext context, String pageKey) {
    return Navigator.pushNamed(context, pageKey);
  }

  //动态跳转
  static navigatorRouterByWidget(BuildContext context, Widget widget) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => widget));
  }
}
