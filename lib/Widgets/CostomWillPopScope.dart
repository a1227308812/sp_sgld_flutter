import 'package:flutter/services.dart';
import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

//右上角home按钮回调
typedef void HomeTap();

class CostomWillPopScope extends StatefulWidget {
  //内容widget
  Widget body;

  //底部导航菜单
  Widget bottomNavigationBar;

  //是否开启双击退出APP  默认不开启
  bool doubleExit;

  //内容页是否充满 默认充满
  bool extendBody;

  //是否显示主页返回按钮 默认显示
  bool showHomeMenu;

  //背景颜色
  int bodyColor;

  //页面标题
  String title;

  //右上角home按钮回调
  HomeTap homeTap;

  CostomWillPopScope({
    @required this.body,
    this.bottomNavigationBar,
    this.title: '',
    this.bodyColor: 0xffffffff,
    this.extendBody: true,
    this.showHomeMenu: true,
    this.doubleExit: false,
  });

  //上一次点击的值
  int last = 0;

  //双击返回
  Future<bool> doubleClickBack() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 1000) {
      last = DateTime.now().millisecondsSinceEpoch;
      showToast('在按一次退出应用程序');
      return Future.value(false);
    } else {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return Future.value(true);
    }
  }

  Future<bool> normal() {
    return Future.value(true);
  }

  @override
  State<CostomWillPopScope> createState() {
    return CostomWillPopScopeState();
  }
}

class CostomWillPopScopeState extends State<CostomWillPopScope> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //返回拦截
      onWillPop: widget.doubleExit ? widget.doubleClickBack : widget.normal,
      child: Scaffold(
        backgroundColor: Color(widget.bodyColor),
        appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            actions: <Widget>[
              Offstage(
                offstage: !widget.showHomeMenu,
                child: GestureDetector(
                  onTap: widget.homeTap == null
                      ? () {
                          //返回主页
                          Navigator.of(context)
                              .popUntil(ModalRoute.withName("/home"));
                        }
                      : widget.homeTap,
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image(
                      image: AssetImage('assets/images/icon_home.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ),
            ]),
        extendBody: widget.extendBody,
        body: widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
