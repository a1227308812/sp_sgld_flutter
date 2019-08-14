import 'package:sp_sgld_flutter/Common/event/PatrolListRefreshEvent.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Widgets/LoaddingDialog.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';

import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/7/11 17:31.
 * 描述：执法信息录入详情页面
 */
class PatrolEntryPage extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

//  static var checkResultUpfileTitle = '检查结果记录表';
//  static var otherUpfileTitle = '其他附件';

  //推送id
  int patrolId = -1;

  PatrolEntryPage(this.patrolId);

  @override
  State<PatrolEntryPage> createState() {
    return _RegulatoryEntryState();
  }
}

class _RegulatoryEntryState extends State<PatrolEntryPage> {
//  //检查结果附件
//  List<Asset> checkUpfileList = List();
//
//  //其他附件
//  List<Asset> otherUpfileList = List();

  //被执法对象
  String bzfdx = '';

//  TextEditingController bzfdxController = TextEditingController();

  //有效证件号码
  String yxzjhm = '';

//  TextEditingController yxzjhmController = TextEditingController();

  //执法人员名称
  TextEditingController zfrymcController = TextEditingController();

  //执法结果说明
  TextEditingController zfjgsmController = TextEditingController();

  //执法结果
  var penaltyResult = '0';

  //执法日期
  String patrolDate = '';

  @override
  void initState() {
    super.initState();
    if (null != widget.patrolId) {
      getInitData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CostomWillPopScope(
      title: '执法信息录入详情',
      extendBody: false,
      bodyColor: 0xfff7f7f9,
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
                      //关闭页面
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
                      // 提交录入数据
                      if (checkInputInfo()) {
                        submitData();
                      }
                    },
                    child: Text('提交'))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              //分割区域
              spaceWidget(),
              _getInfoItem(title: '被执法对象：', hint: '请输入被执法对象姓名', content: bzfdx),
              _getInfoItem(title: '有效证件号：', hint: '请输入有效证件号', content: yxzjhm),
              _getJCRQItem(title: '执法日期：', hint: '请选择执法日期'),
              _getXCRYItem(
                  title: '执法人员：',
                  hint: '请输入执法人员名称',
                  controller: zfrymcController),
              // 执法结果选择
              _getZFJGItem(title: '执法结果：', hint: '请选择执法结果'),
              //执法结果说明
              _getZFJGSMItem(zfjgsmController),
              //上传附件暂时不做
//            //检查结果附件
//            buildJCJGJLBLayout(checkUpfileList),
//            //其他附件
//            buildotherUpfileLayout(otherUpfileList),
              //分割区域
              spaceWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _getInfoItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: PatrolEntryPage.itemHeight,
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
                    margin:
                        EdgeInsets.only(right: PatrolEntryPage.itemMaginLeft),
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
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //执法日期
  _getJCRQItem(
      {String title,
      String hint,
      TextEditingController controller,
      bool isMandatory = true}) {
    return Container(
      height: PatrolEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then((selectDate) {
                        //设置选择的日期
                        print(selectDate.toIso8601String());
                        this.patrolDate =
                            '${selectDate.year}-${selectDate.month < 10 ? '0' + selectDate.month.toString() : selectDate.month}-${selectDate.day < 10 ? '0' + selectDate.day.toString() : selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: PatrolEntryPage.itemMaginLeft),
                      child: Text(
                        patrolDate == '' ? '请选择执法日期' : patrolDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //检查次数
  _getJCCSItem(
      {String title,
      String hint,
      TextEditingController controller,
      bool isMandatory = true}) {
    return Container(
      height: PatrolEntryPage.itemHeight,
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
                        right: PatrolEntryPage.itemMaginLeft),
                    child: TextField(
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '$hint', border: InputBorder.none),
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //巡查人员
  _getXCRYItem(
      {String title,
      String hint,
      TextEditingController controller,
      bool isMandatory = true}) {
    return Container(
      height: PatrolEntryPage.itemHeight,
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
                        right: PatrolEntryPage.itemMaginLeft),
                    child: TextField(
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: '$hint', border: InputBorder.none),
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Offstage(
            offstage: false,
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  //执法结果说明
  _getZFJGSMItem(TextEditingController textEditController,
      {bool isMandatory = true}) {
    String title = '执法结果说明';
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

  //分割线
  spaceWidget() {
    return Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xfff7f7f9),
    );
  }

  //是否显示必填
  buildTipView(bool isMandatory) {
    return Container(
      margin: EdgeInsets.only(left: PatrolEntryPage.itemMaginLeft),
      child: Text(
        '*',
        style: TextStyle(color: isMandatory ? Colors.red : Colors.white),
      ),
    );
  }

  //获取初始化数据
  void getInitData() async {
    ResultData resultData =
        await BasicNetService().post(Api.addApparitorPage, params: {
      "patrolId": widget.patrolId,
    });
    if (resultData.resultStatue) {
      Patrol patrol = Patrol.fromJson(resultData.data);
      if (null != patrol) {
        bzfdx = patrol.proposerName ?? '';
        yxzjhm = patrol.no ?? '';
      }
      setState(() {});
    }
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
    ResultData resultData =
        await BasicNetService().post(Api.addApparitor, params: {
      "patrolId": widget.patrolId, //
      "proposerName": bzfdx.trim(),
      "no": yxzjhm.trim(), //有效证件号码
      "apparitorDate": patrolDate, //执法日期
      "apparitorName": zfrymcController.text.trim(), //执法人员名称
      /**执法结果
       * <DataDic code="0" zvalue="警告"/>
          <DataDic code="1" zvalue="罚款"/>
          <DataDic code="2" zvalue="行政拘留"/>
          <DataDic code="3" zvalue="吊销"/>
          <DataDic code="4" zvalue="收缴和追缴"/>
          <DataDic code="5" zvalue="其它"/>*/
      "penaltyResult": penaltyResult, //执法结果
      "apparitorResultExplain": zfjgsmController.text.trim(), //执法结果说明
//      "listNoteTableFile": '{}', //执法结果记录
//      "listOtherFile": '{}' //其它附件
    });
    //提交数据成功
    if (resultData.resultStatue) {
      //发送刷新事件
      EventHelper.eventBus.fire(PatrolListRefreshEvent());
      //关闭弹窗
      Navigator.pop(context);
      //关闭界面
      Navigator.pop(context);
    } else {
      showToast(resultData.data);
    }
  }

  //检查结果说明
  _getJCJGSMItem(TextEditingController textEditController,
      {bool isMandatory = true}) {
    String title = '检查结果说明';
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

  //检查必填项
  bool checkInputInfo() {
    if (bzfdx.trim().length <= 0) {
      showToast('请填写被执法对象');
      return false;
    }
    if (yxzjhm.trim().length <= 0) {
      showToast('请填写有效证件号码');
      return false;
    }
    if (patrolDate.trim().length <= 0) {
      showToast('请填写执法日期');
      return false;
    }
    if (zfrymcController.text.trim().length <= 0) {
      showToast('请填写执法人员名称');
      return false;
    }
    if (zfjgsmController.text.trim().length <= 0) {
      showToast('执法结果说明不能为空');
      return false;
    }
    return true;
  }

  //执法结果选择
  _getZFJGItem({String title, String hint, bool isMandatory = true}) {
    /**
     * <DataDic code="0" zvalue="警告"/>
        <DataDic code="1" zvalue="罚款"/>
        <DataDic code="2" zvalue="行政拘留"/>
        <DataDic code="3" zvalue="吊销"/>
        <DataDic code="4" zvalue="收缴和追缴"/>
        <DataDic code="5" zvalue="其它"/>
     */
    List<DropdownMenuItem> itemList = List();
    itemList
      ..add(DropdownMenuItem(
        child: Text('警告'),
        value: '0',
      ))
      ..add(DropdownMenuItem(
        child: Text('罚款'),
        value: '1',
      ))
      ..add(DropdownMenuItem(
        child: Text('行政拘留'),
        value: '2',
      ))
      ..add(DropdownMenuItem(
        child: Text('吊销'),
        value: '3',
      ))
      ..add(DropdownMenuItem(
        child: Text('收缴和追缴'),
        value: '4',
      ))
      ..add(DropdownMenuItem(
        child: Text('其它'),
        value: '5',
      ));

    return Container(
      height: PatrolEntryPage.itemHeight,
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
                        right: PatrolEntryPage.itemMaginLeft),
                    child: DropdownButton(
                      items: itemList,
                      hint: Text(hint),
                      //当没有默认值的时候可以设置的提示
                      value: penaltyResult,
                      //下拉菜单选择完之后显示给用户的值
                      onChanged: (dynamic value) {
                        //下拉菜单item点击之后的回调
                        penaltyResult = value;
                        setState(() {});
                      },
//                      //减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
//                      isDense: false,
                      //设置三角标icon的大小
                      iconSize: ScreenUtil().setWidth(60),
                      isExpanded: true,
                      //设置阴影的高度
                      elevation: 16,
                      //设置文本框里面文字的样式
                      underline: Container(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
          Offstage(
            offstage: false,
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class UpfileItemStateless extends StatelessWidget {
  List list;

  //附件类型
  var type;

  UpfileItemStateless(this.list, this.type);

  @override
  Widget build(BuildContext context) {
    return UpfileItemStateful(list, type);
  }
}

class UpfileItemStateful extends StatefulWidget {
  List list;

  //附件类型
  var type;

  UpfileItemStateful(this.list, this.type);

  @override
  State<UpfileItemStateful> createState() {
    return UpfileItemState();
  }
}

class UpfileItemState extends State<UpfileItemStateful> {
  //删除按钮的显示状态  默认不显示，长按附件item显示删除按钮
  bool showDelButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildItem(widget.list),
    );
  }

  buildItem(List<Asset> list) {
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Container(
      margin: EdgeInsets.only(left: PatrolEntryPage.itemMaginLeft),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(80),
      child: Text(widget.type),
    ));
    //分割线
    widgetList.add(Container(
      height: ScreenUtil().setHeight(1),
      color: Colors.grey,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
    ));
    //上传按钮
    widgetList.add(GestureDetector(
      onTap: () {
        //todo 选择图片或者文件或者拍照
        pickerImages(list);
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        width: double.infinity,
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30),
            top: ScreenUtil().setWidth(30),
            bottom: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            border:
                Border.all(width: ScreenUtil().setWidth(1), color: Colors.grey),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10)))),
        alignment: Alignment.center,
        child: Text('上传'),
      ),
    ));
    //循环添加item
    for (int position = 0; position < list.length; position++) {
      Asset asset = list[position];
      Widget widget = Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setWidth(40),
                child: Text(
                  (position + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onLongPress: () {
                    //长按显示/隐藏所有item的删除按钮（打开/关闭删除功能），点击删除按钮删除对应控件和相关数据
                    showDelButton
                        ? showDelButton = false
                        : showDelButton = true;
                    setState(() {});
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(10),
                            right: ScreenUtil().setWidth(30)),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: ScreenUtil().setHeight(100),
                        child: Text(
                          '${asset.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      showDelButton
                          ? Positioned(
                              right: ScreenUtil().setWidth(30),
                              child: GestureDetector(
                                  onTap: () {
                                    list.removeWhere((Asset checkAsset) =>
                                        checkAsset.name == asset.name);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.delete_forever)),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            color: Colors.grey,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(30)),
          ),
        ],
      );
      widgetList.add(widget);
    }
    return widgetList;
  }

  //图片选择
  pickerImages(List<Asset> selectedAssetList) async {
    String error = '';
    try {
      await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: selectedAssetList,
        materialOptions: MaterialOptions(
          actionBarTitle: "",
          allViewTitle: "图片选择",
          actionBarColor: "#2196F3",
          actionBarTitleColor: "#ffffff",
          lightStatusBar: true,
          statusBarColor: '#2196F3',
          startInAllView: true,
          selectCircleStrokeColor: "#ffffff",
          selectionLimitReachedText: "你不能再选择更多图片了.",
        ),
      ).then((selectImgList) {
        widget.list = selectImgList;
        setState(() {});
      });
    } on PlatformException catch (e) {
      error = e.message;
      print(error);
    }
  }
}
