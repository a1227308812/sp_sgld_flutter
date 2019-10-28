import 'package:flutter/cupertino.dart';
import 'package:sp_sgld_flutter/Common/Http/Api.dart';
import 'package:sp_sgld_flutter/Common/Http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';

import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/6/20 18:16.
 * 描述：登录页面
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  TextEditingController accountController = TextEditingController()..value = TextEditingValue(text: 'scjgjjg001');
//  TextEditingController accountController = TextEditingController()..value = TextEditingValue(text: 'scjgjzf001');
  TextEditingController accountController = TextEditingController();
//  TextEditingController passwordController = TextEditingController()..value = TextEditingValue(text: '1');
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return _getContentWidget();
  }

  /**
   * 根布局
   */
  _getContentWidget() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/login_bg.png'),
        fit: BoxFit.fill,
      )),
      //滚动竖向排列布局
      child: ListView(
        //shrinkWrap：该属性表示是否根据子widget的总长度来设置ListView的长度，
        // 默认值为false 。默认情况下，ListView的会在滚动方向尽可能多的占用空间。
        // 当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true
        shrinkWrap: false,
        children: <Widget>[
          //logo
          _getHeadImageWidget(),
          //标题
          _getTitleLayout(),
          //账号输入框
          _getInputLayout(accountController, "assets/images/icon_account.png",
              "请输入用户名", false),
          //密码输入框
          _getInputLayout(passwordController, "assets/images/icon_password.png",
              "请输入密码", true),
//          //注册和忘记密码
//          _getRegisterOrForgetLayout(),
          //登录按钮
          _getLoginInLayout(),
        ],
      ),
    );
  }

  //头部logo
  _getHeadImageWidget() {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(164)),
      child: Image.asset(
        "assets/images/ic_logo.png",
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setWidth(150),
        fit: BoxFit.contain,
      ),
    );
  }

  /**
   * 获取输入布局
   */
  _getInputLayout(TextEditingController controller, String lableIcon,
      String hintText, bool b) {
    return Center(
      child: Container(
        width: ScreenUtil().setWidth(650),
        height: ScreenUtil().setHeight(85),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(6)))),
        padding: EdgeInsets.only(
            right: ScreenUtil.instance.setWidth(30),
            left: ScreenUtil.instance.setWidth(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                child: Image.asset(
                  lableIcon,
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setWidth(30),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Material(
                child: Container(
                  child: TextField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: b,
                    textInputAction:
                        b ? TextInputAction.done : TextInputAction.next,
                    //软键盘的点击确定监听回调
                    onSubmitted: (String text) async {
                      if (b) {
                        if (checkInfo()) {
                          //获取登录信息
                          ResultData resultData = await BasicNetService()
                              .post(Api.login, params: {
                            'loginName': accountController.text,
                            'password': passwordController.text
                          });
                          if (resultData.resultStatue) {
                            UserInfo userInfo =
                                UserInfo.fromJson(resultData.data ?? "");
                            //缓存本地
                            await LocalStorage.saveString(
                                LocalStorageKey.user, json.encode(userInfo));
                            await LocalStorage.saveString(
                                LocalStorageKey.authKey, userInfo.authKey);
                            NavigatorUtils.navigatorRouterByName(
                                context, NavigatorUtils.homePageKey);
                          } else {
                            showToast(resultData.data);
                          }
                        }
                      }
                    },
                    controller: controller,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      decorationColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //设置注册和忘记密码布局
  _getRegisterOrForgetLayout() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(35),
          left: ScreenUtil().setWidth(66),
          right: ScreenUtil().setWidth(66)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Text("注册",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Color.fromARGB(255, 120, 206, 253),
                  decorationColor: Colors.white,
                )),
            onTap: () {
              print("点击了注册按钮");
            },
          ),
          GestureDetector(
            child: Text(
              "忘记密码",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color.fromARGB(255, 120, 206, 253),
                decorationColor: Colors.white,
              ),
            ),
            onTap: () {
              print("点击了忘记密码按钮");
              NavigatorUtils.navigatorRouterByName(
                  context, NavigatorUtils.changePasswordPageKey);
            },
          ),
        ],
      ),
    );
  }

  //设置标题
  _getTitleLayout() {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      child: Center(
          child: Text("经开区审管联动",
              maxLines: 1,
              style: TextStyle(
                color: Color.fromARGB(255, 55, 152, 216),
                fontSize: ScreenUtil().setSp(61),
                decoration: TextDecoration.none,
              ))),
    );
  }

  //获取登录按钮
  _getLoginInLayout() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(143)),
        width: ScreenUtil().setWidth(650),
        height: ScreenUtil().setHeight(80),
        child: RaisedButton(
          child: Text("登录", style: TextStyle(fontSize: ScreenUtil().setSp(30))),
          color: Color.fromARGB(255, 120, 206, 253),
          colorBrightness: Brightness.dark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          //点击事件
          onPressed: () async {
//            NavigatorUtils.navigatorRouterByName(
//                context, NavigatorUtils.rectificationEntryPageKey);
//            return;
            if (checkInfo()) {
              //获取登录信息
              ResultData resultData = await BasicNetService().post(Api.login,
                  params: {
                    'loginName': accountController.text,
                    'password': passwordController.text
                  });
              if (resultData.resultStatue) {
                UserInfo userInfo = UserInfo.fromJson(resultData.data ?? "");
                //缓存本地
                await LocalStorage.saveString(
                    LocalStorageKey.user, json.encode(userInfo));
                await LocalStorage.saveString(
                    LocalStorageKey.authKey, userInfo.authKey);
                NavigatorUtils.navigatorRouterByName(
                    context, NavigatorUtils.homePageKey);
              } else {
                showToast(resultData.data);
              }
            }
          },
        ),
      ),
    );
  }

  //检查必填项
  bool checkInfo() {
    if ("" == accountController.text) {
      showToast('账号不能为空！');
      return false;
    }

    if ("" == passwordController.text) {
      showToast('密码不能为空！');
      return false;
    }

    return true;
//    showCupertinoDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return CupertinoAlertDialog(
////            title: Text("提示"),
//            content: CupertinoActivityIndicator(
//              radius: 20,
//            ),
//          );
//        });
  }

  /**
   * 弹出提示dialog
   */
  void showMessageDialog(String message) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
//            title: Text("提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
