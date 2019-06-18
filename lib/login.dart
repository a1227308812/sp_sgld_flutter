import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController accountController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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
      color: Colors.white,
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
          _getInputLayout(accountController, "assets/images/logo.png", "请输入密码"),
          //密码输入框
          _getInputLayout(
              passwordController, "assets/images/logo.png", "请输入密码"),
          //注册和忘记密码
          _getRegisterOrForgetLayout(),
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
        "assets/images/logo.png",
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setWidth(150),
        fit: BoxFit.contain,
      ),
    );
  }

  /**
   * 获取输入布局
   */
  _getInputLayout(
      TextEditingController controller, String lableIcon, String hintText) {
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
                  width: 30,
                  height: 30,
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
                    textInputAction: TextInputAction.done,
                    controller: controller,
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                    decoration: InputDecoration(
                      hintText: "请输入密码",
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
          Text("注册",

              style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Color.fromARGB(255, 120, 206, 253))),
          Text(
            "忘记密码",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Color.fromARGB(255, 120, 206, 253)),
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
                fontSize: 31,
                decorationColor: Colors.white,
              ))),
    );
  }

  //获取登录按钮
  _getLoginInLayout() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(43)),
        width: ScreenUtil().setWidth(650),
        height: ScreenUtil().setHeight(80),
        child: RaisedButton(
          child: Text("登录", style: TextStyle(fontSize: ScreenUtil().setSp(20))),
          color: Color.fromARGB(255, 120, 206, 253),
          colorBrightness: Brightness.dark,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          //点击事件
          onPressed: () {
            checkInfo();
          },
        ),
      ),
    );
  }

  //检查必填项
  checkInfo() {
    if ("" == accountController.text) {
      showMessageDialog("账号不能为空！");
      return;
    }

    if ("" == passwordController.text) {
      showMessageDialog("密码不能为空！");
      return;
    }

    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
//            title: Text("提示"),
            content: CupertinoActivityIndicator(
              radius: 20,
            ),
          );
        });
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
