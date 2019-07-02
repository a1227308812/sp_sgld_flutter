import 'package:oktoast/oktoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
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
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String menuType;

  @override
  Widget build(BuildContext context) {
    //获取菜单列表
    getMenuList();
    return Scaffold(
      appBar: AppBar(
        title: Text('经开区审管联动'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(20),
            ),
            _getItemLayout('事项认领', 'assets/images/index_icon_sxrl.png',
                'assets/images/index_icon_arrow.png', 0xff2dc2ea, 0),
            _getItemLayout('监管信息录入', 'assets/images/index_icon_jgxxlr.png',
                'assets/images/index_icon_arrow.png', 0xff4ee9c9, 1),
            _getItemLayout('整改信息录入', 'assets/images/index_icon_zgxxlr.png',
                'assets/images/index_icon_arrow.png', 0xff72a3ff, 2),
            _getItemLayout('综合查询', 'assets/images/index_icon_zhcx.png',
                'assets/images/index_icon_arrow.png', 0xff8b73ff, 3),
          ],
        ),
      ),
    );
  }

  _getItemLayout(
    String title, [
    String icon,
    String arrowIcon,
    int color,
    int index,
  ]) {
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
        if (index == 0) {
          NavigatorUtils.navigatorRouterByName(
              context, NavigatorUtils.itemClaimPageKey);
        } else if (index == 1) {
          NavigatorUtils.navigatorRouterByName(
              context, NavigatorUtils.regulatoryInformationEntryPageKey);
        } else if (index == 2) {
          NavigatorUtils.navigatorRouterByName(
              context, NavigatorUtils.rectificationInformationEntryPageKey);
        } else {
          NavigatorUtils.navigatorRouterByName(
              context, NavigatorUtils.integratedQueryPageKey);
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

  void getMenuList() async {
    await getMenuType();
    ResultData resultData = await BasicNetService().post(Api.listDataDic,
        params: {'type': this.menuType});
    print(resultData);
  }

  void getMenuType() async {
    String userJson = await LocalStorage.getString(LocalStorageKey.user);
    UserInfo userInfo = UserInfo.fromJson(json.decode(userJson));
    menuType = 'superviseAppMenu' + userInfo.depType;
    print(menuType);
  }
}
