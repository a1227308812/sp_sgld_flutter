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
class RectificationEntryPage extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  @override
  State<RectificationEntryPage> createState() {
    // TODO: implement createState
    return RectificationEntryState();
  }
}

class RectificationEntryState extends State<RectificationEntryPage> {
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
        title: Text('整改信息录入'),
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
            _getInfoItem(title: '被检查人：', content: '张三'),
            _getInfoItem(title: '身份证号：', content: '511333xxxxxxxxxxxx'),
            _getInfoItem(title: '公示范围：', content: '3'),
            _getInfoItem(title: '检查日期：', content: '2019-06-21'),
            _getInfoItem(title: '巡查人员：', content: '张三'),
            _getInfoItem(title: '检查次数：', content: '3'),
            _getInfoItem(title: '检查结果：', content: '3'),
            _getInfoItem(title: '处理结果：', content: '3'),
            //只有选择的期限整改才会有整改到期日期选择
            true ? _getInfoItem(title: '整改到期日期：', content: '') : Center(),
            _getInfoItemForMultiple(title: '检查结果说明：', content: '3'),
            //分割区域
            spaceWidget(),
            //企业区域标题
            getAreaTitle(),
            _getJCJGItem(title: '检查结果：'),
            //整改结果说明输入框
            _getZGJGSMItem(jcjgController),
            //分割区域
            spaceWidget(),
          ],
        ),
      ),
    );
  }

  _getInfoItem({String title, String content}) {
    return Container(
      height: RectificationEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: RectificationEntryPage.itemMaginLeft),
                  child: Text('$title'),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: RectificationEntryPage.itemMaginLeft),
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

  //检查结果
  _getJCJGItem({String title, bool isMandatory = true}) {
    return Container(
      height: RectificationEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        right: RectificationEntryPage.itemMaginLeft),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: SingleRadio(
                            title: '符合',
                            groupValue: checkResult,
                            value: 0,
                            selectRadio: (value) {
                              checkResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '基本符合',
                            groupValue: checkResult,
                            value: 1,
                            selectRadio: (value) {
                              checkResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '不符合',
                            groupValue: checkResult,
                            value: 2,
                            selectRadio: (value) {
                              checkResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
      margin: EdgeInsets.only(left: RectificationEntryPage.itemMaginLeft),
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

  //检查结果说明
  _getZGJGSMItem(TextEditingController textEditController,
      {bool isMandatory = true}) {
    String title = '整改结果说明';
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Row(
      children: <Widget>[
        buildTipView(isMandatory),
        Container(
          alignment: Alignment.centerLeft,
          height: ScreenUtil().setHeight(80),
          child: Text(title),
        ),
      ],
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
          maxHeight: ScreenUtil().setHeight(200),
          minHeight: ScreenUtil().setHeight(100)),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: TextField(
        controller: textEditController,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '请输入$title',
          contentPadding: EdgeInsets.all(ScreenUtil().setHeight(10)),
        ),
      ),
    ));
    return Column(
      children: widgetList,
    );
  }

  //不可修改的检查结果说明
  _getInfoItemForMultiple({String title, String content}) {
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Container(
      margin: EdgeInsets.only(left: RectificationEntryPage.itemMaginLeft),
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

  //创建区域标题
  getAreaTitle() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: RectificationEntryPage.itemMaginLeft),
          constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(80)),
          child: Text(
            '企业整改信息录入',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: ScreenUtil().setSp(40)),
          ),
        ),
        getDivider(),
      ],
    );
  }

  //分割线
  getDivider() {
    return Container(
      height: ScreenUtil().setHeight(1),
      margin: EdgeInsets.only(
          left: RectificationEntryPage.itemMaginLeft,
          right: RectificationEntryPage.itemMaginLeft),
      color: Colors.grey,
    );
  }
}
