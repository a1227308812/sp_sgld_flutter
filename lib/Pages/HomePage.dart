import 'package:oktoast/oktoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/modle/MenuInfo.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Utils/NavigatorUtils.dart';
import 'dart:convert';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';

/**
 * Created by ZWP on 2019/6/20 18:16.
 * 描述：主页
 */
class HomePage extends StatefulWidget {
  static const List menuBgColors = [
    0xff2dc2ea,
    0xff4ee9c9,
    0xff72a3ff,
    0xff8b73ff,
    0xff8b73ff,
    0xff8b73ff
  ];

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String menuType;
  List<MenuInfo> menuList;
  List<Widget> menuWidgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMenuList();
  }

  @override
  Widget build(BuildContext context) {
    //获取菜单列表
    return Scaffold(
      appBar: AppBar(
        title: Text('经开区审管联动'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: menuWidgets,
        ),
      ),
    );
  }

  //设置菜单布局
  _getItemLayout({
    String title,
    String menuCode,
    String icon,
    String arrowIcon: 'assets/images/index_icon_arrow.png',
    int color: 0xff8b73ff,
  }) {
    List<BoxShadow> shadows = List<BoxShadow>();
    BoxShadow boxShadow = BoxShadow(
        color: Color(
          0x21217fbd,
        ),
        blurRadius: 18);
    shadows.add(boxShadow);
    return GestureDetector(
      onTap: () {
        //点击事件
        showToast(title);
        switch (menuCode) {
          case 'inquest': //现场勘验
            break;
          case 'itemClaim': //事项认领
            NavigatorUtils.navigatorRouterByName(
                context, NavigatorUtils.itemClaimPageKey);
            break;
          case 'superviseInput': //监管信息录入
            NavigatorUtils.navigatorRouterByName(
                context, NavigatorUtils.regulatoryInformationEntryListPageKey);
            break;
          case 'rectificationInput': //整改信息录入
            NavigatorUtils.navigatorRouterByName(
                context, NavigatorUtils.rectificationInformationEntryListPageKey);
            break;
          case 'comprehensive': //综合查询
            NavigatorUtils.navigatorRouterByName(
                context, NavigatorUtils.integratedQueryListPageKey);
            break;
          case 'comprehensive': //综合查询
            NavigatorUtils.navigatorRouterByName(
                context, NavigatorUtils.integratedQueryListPageKey);
            break;
        }
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
          width: ScreenUtil().setWidth(656),
          height: ScreenUtil().setWidth(178),
          decoration: BoxDecoration(
            color: Color(color),
            boxShadow: shadows,
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(63),
                      right: ScreenUtil().setWidth(80)),
                  child: Image.asset(
                    icon,
                    width: ScreenUtil().setWidth(110),
                    height: ScreenUtil().setWidth(110),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      decorationColor: Colors.white,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      right: ScreenUtil().setWidth(50)),
                  child: Image.asset(
                    arrowIcon,
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //获取菜单列表
  void getMenuList() async {
    await getMenuType();
    ResultData resultData = await BasicNetService()
        .post(Api.listDataDic, params: {'type': this.menuType});
    //把对应的map集合转化成对应的对象集合
    List mapList = resultData.data;
    menuList = mapList.map((var map) => MenuInfo.fromJson(map)).toList();
    //添加上
    menuWidgets.add(Container(
      height: ScreenUtil().setHeight(20),
    ));
    for (var i = 0; i < menuList.length; i++) {
      menuWidgets.add(_getItemLayout(
          title: menuList[i].zvalue,
          icon: getMenuLable(menuList[i].code),
          menuCode: menuList[i].code,
          color: HomePage.menuBgColors[i]));
    }
    setState(() {});
  }

  //拼接请求参数
  void getMenuType() async {
    String userJson = await LocalStorage.getString(LocalStorageKey.user);
    UserInfo userInfo = UserInfo.fromJson(json.decode(userJson));
    menuType = 'superviseAppMenu' + userInfo.depType;
  }

  //获取菜单lable
  getMenuLable(String menuCode) {
    switch (menuCode) {
      case 'inquest': //现场勘验
        return 'assets/images/index_icon_sxrl.png';
      case 'itemClaim': //事项认领
        return 'assets/images/index_icon_sxrl.png';
      case 'superviseInput': //监管信息录入
        return 'assets/images/index_icon_jgxxlr.png';
      case 'rectificationInput': //整改信息录入
        return 'assets/images/index_icon_zgxxlr.png';
      case 'comprehensive': //综合查询
        return 'assets/images/index_icon_zhcx.png';
    }
  }
}
