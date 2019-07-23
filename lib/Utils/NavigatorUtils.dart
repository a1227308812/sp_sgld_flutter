import 'package:flutter/cupertino.dart';
import 'package:sp_sgld_flutter/Pages/ChangePaswordPage.dart';
import 'package:sp_sgld_flutter/Pages/HomePage.dart';
import 'package:sp_sgld_flutter/Pages/IntegratedQueryDetail.dart';
import 'package:sp_sgld_flutter/Pages/IntegratedQueryListPage.dart';
import 'package:sp_sgld_flutter/Pages/LoginPage.dart';

import 'package:sp_sgld_flutter/Pages/ItemClaimListPage.dart';
import 'package:sp_sgld_flutter/Pages/RectificationEntry.dart';
import 'package:sp_sgld_flutter/Pages/RectificationInformationEntryListPage.dart';
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

  //监管信息录入列表
  static String regulatoryInformationEntryListPageKey =
      '/regulatoryInformationEntryListPageKey';

  //监管信息录入详情
  static String regulatoryEntryPageKey = '/regulatoryEntryPageKey';

  //整改信息录入列表
  static String rectificationInformationEntryListPageKey =
      '/rectificationInformationEntryListPageKey';

  //整改信息录入详情
  static String rectificationEntryPageKey = '/rectificationEntryPageKey';

  //综合查询
  static String integratedQueryListPageKey = '/integratedQueryListPageKey';
  //综合查询详情
  static String integratedQueryDetailPageKey = '/integratedQueryDetailPageKey';

  static Map<String, WidgetBuilder> router = {
    //注册登录页面路由
    loginPageKey: (context) => LoginPage(),
    homePageKey: (context) => HomePage(),

    changePasswordPageKey: (context) => ChangePassword(),

    itemClaimPageKey: (context) => ItemCliamListPage(),

    regulatoryInformationEntryListPageKey: (context) =>
        RegulatoryInformationEntryListPage(),
    regulatoryEntryPageKey: (context) => RegulatoryEntryPage(),

    rectificationInformationEntryListPageKey: (context) =>
        RectificationInformationEntryListPage(),
    rectificationEntryPageKey: (context) => RectificationEntryPage(),

    integratedQueryListPageKey: (context) => IntegratedQueryListPage(),
    integratedQueryDetailPageKey: (context) => IntegratedQueryDetail(),
  };

  //静态跳转
  static navigatorRouterByName(BuildContext context, String pageKey,
      {Object arguments}) {
    return Navigator.pushNamed(context, pageKey, arguments: arguments);
  }

  //动态跳转
  static navigatorRouterByWidget(
      {BuildContext context, Widget widget, Object arguments}) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => widget));
  }
}
