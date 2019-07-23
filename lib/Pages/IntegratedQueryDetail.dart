import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:sp_sgld_flutter/Widgets/CustomBorder.dart';
import 'package:sp_sgld_flutter/Widgets/LoaddingDialog.dart';
import 'package:sp_sgld_flutter/Widgets/SingleRadio.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';

/**
 * Created by ZWP on 2019/7/19 10:59.
 * 描述：整改录入详情页面
 */
class IntegratedQueryDetail extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  @override
  State<IntegratedQueryDetail> createState() {
    // TODO: implement createState
    return IntegratedQueryDetailState();
  }
}

class IntegratedQueryDetailState extends State<IntegratedQueryDetail> {
  //企业检查结果
  int checkResult = 0;

  //企业的检查结果
  TextEditingController jcjgController = TextEditingController();

  //整改结果说明
  TextEditingController zgjgsmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('综合查询详情'),
        centerTitle: true,
      ),
      extendBody: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(
                    onPressed: () {
                      //todo 关闭页面
                      Navigator.pop(context);
                    },
                    child: Text('取消'))),
            Container(
              color: Colors.grey,
              height: double.infinity,
              width: 1,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(
                    onPressed: () {
                      //todo 提交录入数据
                      submitData();
                    },
                    child: Text('提交'))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //分割区域
            spaceWidget(),
            _getInfoItem(title: '单位名称/姓名：', content: '张三'),
            _getInfoItem(title: '证件号码：', content: '511333xxxxxxxxxxxx'),
            _getInfoItem(title: '公示范围：', content: '3'),
            _getInfoItem(title: '检查日期：', content: '2019-06-21'),
            _getInfoItem(title: '检查次数：', content: '3'),
            _getInfoItem(title: '检查结果：', content: '3'),
            _getInfoItem(title: '处理结果：', content: '3'),
            //只有选择的期限整改才会有整改到期日期选择
            true ? _getInfoItem(title: '整改到期日期：', content: '') : Center(),
            _getInfoItemForMultiple(title: '检查结果说明：', content: '3'),
          ],
        ),
      ),
    );
  }

  _getInfoItem({String title, String content}) {
    return Container(
      height: IntegratedQueryDetail.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: IntegratedQueryDetail.itemMaginLeft),
                  child: Text('$title'),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: IntegratedQueryDetail.itemMaginLeft),
                    child: Text(
                      '$content',
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          getDivider(),
        ],
      ),
    );
  }


  //分割线
  spaceWidget() {
    return Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xfff7f7f9),
    );
  }

  buildTipView(bool isMandatory) {
    return Container(
      margin: EdgeInsets.only(left: IntegratedQueryDetail.itemMaginLeft),
      child: Text(
        '*',
        style: TextStyle(color: isMandatory ? Colors.red : Colors.white),
      ),
    );
  }

  //提交数据
  void submitData() async {
    //弹出加载框
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return LoaddingDialog();
        });
//    ResultData resultData =
//        await BasicNetService().post(Api.addPatrol, params: {
//      "superBusId": 56, //
//      "businessId": "310",
//      "proposerName": "",
//      "patrolDate": "2019-06-10", //检查日期
//      "patrolNum": "3", //检查次数
//      "patrolResult": "1", //检查结果 1.符合 2基本符合  3不符合
//      "treatmentResult": "1", //处理结果 1通过  2限期整改 3移交执法
//      "rummageName": "巡查人员",
//      "treatmentEndDate": "2019-07-07", //整改到期日期
//      "patrolResultExplain": "" //检查结果说明
//    });
//    if (resultData.resultStatue) {
//      //提交数据完成
//      Navigator.pop(context);
//    }
  }


  //不可修改的检查结果说明
  _getInfoItemForMultiple({String title, String content}) {
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Container(
      margin: EdgeInsets.only(left: IntegratedQueryDetail.itemMaginLeft),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(80),
      child: Text(title),
    ));
    //输入框
    widgetList.add(Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30),
          bottom: ScreenUtil().setWidth(30)),
      constraints: BoxConstraints(
        maxHeight: ScreenUtil().setHeight(100),
      ),
      child: Text(
        '$content',
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        maxLines: null,
      ),
    ));
    return Column(
      children: widgetList,
    );
  }


  //分割线
  getDivider() {
    return Container(
      height: ScreenUtil().setHeight(1),
      margin: EdgeInsets.only(
          left: IntegratedQueryDetail.itemMaginLeft,
          right: IntegratedQueryDetail.itemMaginLeft),
      color: Colors.grey,
    );
  }
}
