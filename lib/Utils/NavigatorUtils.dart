import 'package:flutter/cupertino.dart';
import 'package:sp_sgld_flutter/Pages/ChangePaswordPage.dart';
import 'package:sp_sgld_flutter/Pages/HomePage.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';

import 'package:sp_sgld_flutter/Pages/ItemClaimListPage.dart';
import 'package:sp_sgld_flutter/Pages/RegulatoryEntry.dart';
import 'package:sp_sgld_flutter/Pages/RegulatoryInformationEntryListPage.dart';

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
  static String regulatoryInformationEntryListPageKey =
      '/regulatoryInformationEntryListPageKey';
  //监管信息录入
  static String regulatoryEntry =
      '/regulatoryEntry';

  //整改信息录入
  static String rectificationInformationEntryPageKey =
      '/rectificationInformationEntry';

  //综合查询
  static String integratedQueryPageKey = '/integratedQuery';

  static Map<String, WidgetBuilder> router = {
    //注册登录页面路由
    loginPageKey: (context) => LoginPage(),
    homePageKey: (context) => HomePage(),

    changePasswordPageKey: (context) => ChangePassword(),

    itemClaimPageKey: (context) => ItemCliamListPage(),

    regulatoryInformationEntryListPageKey: (context) =>
        RegulatoryInformationEntryListPage(),
    regulatoryEntry: (context) =>
        RegulatoryEntryPage(),

    rectificationInformationEntryPageKey: (context) => ChangePassword(),

    integratedQueryPageKey: (context) => ChangePassword(),
  };

  //静态跳转
  static navigatorRouterByName(BuildContext context, String pageKey,{ Object arguments}) {
    return Navigator.pushNamed(context, pageKey, arguments: arguments);
  }

  //动态跳转
  static navigatorRouterByWidget(
      {BuildContext context, Widget widget, Object arguments}) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => widget));
  }
}
