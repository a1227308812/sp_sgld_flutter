import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/6/20 18:17.
 * 描述：修改密码界面
 */
class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangePasswordState();
  }
}

class ItemInfo {
  String title;
  String hint;

  ItemInfo(this.title, this.hint);
}

class _ChangePasswordState extends State<ChangePassword> {
  List<ItemInfo> itemList = List()
    ..add(new ItemInfo('旧密码', '请输入旧密码'))
    ..add(new ItemInfo('新密码', '请输入新密码'))
    ..add(new ItemInfo('确认新密码', '请输入确认密码'))
    ..add(new ItemInfo('', ''));

  TextStyle _textStyle = TextStyle(
    fontSize: ScreenUtil().setSp(28),
    color: Color(0xff373b40),
    decorationColor: Colors.white,
  );
  TextStyle _hintStyle = TextStyle(
    fontSize: ScreenUtil().setSp(28),
    color: Color(0xffa0a4a9),
  );

  TextEditingController oldPwdController = TextEditingController();
  TextEditingController newPwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("修改密码"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _getItemLayout(itemList[0], oldPwdController),
          _getItemLayout(itemList[1], newPwdController),
          _getItemLayout(itemList[2], confirmPwdController),
          //提交按钮
          Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
              width: ScreenUtil().setWidth(650),
              height: ScreenUtil().setHeight(80),
              child: RaisedButton(
                  child: Text("提交"),
                  onPressed: () {
                    if (checkInfo()) {
                      NavigatorUtils.navigatorRouterByName(
                          context, NavigatorUtils.homePageKey);
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 初始化item布局
   */
  _getItemLayout(ItemInfo itemInfo, TextEditingController controller) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(150),
                child: Text(
                  itemInfo.title,
                  style: _textStyle,
                ),
              ),
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  controller: controller,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintText: itemInfo.hint,
                    hintStyle: _hintStyle,
                    border: InputBorder.none,
                  ),
                  style: _textStyle,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  bool checkInfo() {
    if ('' == oldPwdController.text) {
      showToast('旧密码不能为空！');
      return false;
    }
    if ('' == newPwdController.text) {
      showToast("新密码不能为空！");
      return false;
    }
    if (newPwdController.text != confirmPwdController.text) {
      showToast('两次输入密码不一致！');
      return false;
    }
    return true;
  }
}
