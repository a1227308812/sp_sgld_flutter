import 'package:sp_sgld_flutter/Common/event/RegulatoryListRefreshEvent.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/modle/Business.dart';
import 'package:sp_sgld_flutter/Common/modle/Proposer.dart';
import 'package:sp_sgld_flutter/Common/modle/SuperBuspush.dart';
import 'package:sp_sgld_flutter/Widgets/LoaddingDialog.dart';
import 'package:sp_sgld_flutter/Widgets/SingleRadio.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';

import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/7/11 17:31.
 * 描述：监管信息录入详情页面
 */
class RegulatoryEntryPage extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  static var checkResultUpfileTitle = '检查结果记录表';
  static var otherUpfileTitle = '其他附件';

  //推送id
  int superBusId = -1;

  RegulatoryEntryPage(this.superBusId);

  @override
  State<RegulatoryEntryPage> createState() {
    return _RegulatoryEntryState();
  }
}

class _RegulatoryEntryState extends State<RegulatoryEntryPage> {
  //检查结果
  var checkResult = 1;

  //处理结果
  var treatmentResult = 1;

  //公示范围
  var showArea = 0;

  //检查日期
  String checkDate = '';

  //整改到期日期
  String rectificationPreiodDate = '';

  //办件id
  int businessId = -1;

//  //检查结果附件
//  List<Asset> checkUpfileList = List();
//
//  //其他附件
//  List<Asset> otherUpfileList = List();

  //被检查人姓名
  String bjcrName = '';

  //身份证号码
  String sfzhName = '';

  //检测次数
  TextEditingController jccsController = TextEditingController();

  //巡查人员
  TextEditingController xcryController = TextEditingController();

  //检查结果说明
  TextEditingController jcjgsmController = TextEditingController();

  //服务对象  //除了自然人 1，其他都按照企业执行
  String serviceObject = '1';

  @override
  void initState() {
    super.initState();
    if (null != widget.superBusId) {
      getInitData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CostomWillPopScope(
      title: '监管信息录入详情',
      extendBody: false,
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
                      //提交录入数据
                      if (checkInputInfo()) {
                        submitData();
                      }
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
            _getInfoItem(
                title: serviceObject == '1' ? '被检查人：' : '被检查企业：',
                hint: '请输入被检查${serviceObject == '1' ? '人姓名' : '企业名称'}',
                content: bjcrName),
            _getInfoItem(
                title: serviceObject == '1' ? '身份证号：' : '企业信用id：',
                hint: '请输入${serviceObject == '1' ? '身份证号码' : '企业信用id'}',
                content: sfzhName),
            _getJCRQItem(title: '检查日期：', hint: '请选择检查日期'),
            _getJCCSItem(
                title: '检查次数：', hint: '请输入检查次数', controller: jccsController),
            _getJCJGItem(title: '检查结果：'),
            _getCLJGItem(title: '处理结果：'),
            _getXCRYItem(
                title: '巡查人员：', hint: '请输入巡查人员名称', controller: xcryController),
            //只有选择的期限整改才会有整改到期日期选择
            treatmentResult == 2
                ? _getZGDQRQItem(title: '整改到期日期：', hint: '请输入检查次数')
                : Center(),
//            //分割区域
//            spaceWidget(),
//            //公示范围
//            getShowArea(title: '公示范围：'),
            //分割区域
            spaceWidget(),
            //检查结果输入框
            _getJCJGSMItem(jcjgsmController),
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
    );
  }

  _getInfoItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
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

  //检查日期
  _getJCRQItem(
      {String title,
      String hint,
      TextEditingController controller,
      bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        this.checkDate =
                            '${selectDate.year}-${selectDate.month < 10 ? '0' + selectDate.month.toString() : selectDate.month}-${selectDate.day < 10 ? '0' + selectDate.day.toString() : selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: RegulatoryEntryPage.itemMaginLeft),
                      child: Text(
                        checkDate == '' ? '请选择检查日期' : checkDate,
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
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
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

  //检查结果
  _getJCJGItem({String title, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: SingleRadio(
                            title: '符合',
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
                            title: '基本符合',
                            groupValue: checkResult,
                            value: 2,
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
                            value: 3,
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
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //处理结果
  _getCLJGItem({String title, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: SingleRadio(
                            title: '通过',
                            groupValue: treatmentResult,
                            value: 1,
                            selectRadio: (value) {
                              treatmentResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '期限整改',
                            groupValue: treatmentResult,
                            value: 2,
                            selectRadio: (value) {
                              treatmentResult = value;
                              // todo 显示整改期限
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '移交执法',
                            groupValue: treatmentResult,
                            value: 3,
                            selectRadio: (value) {
                              treatmentResult = value;
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
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
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
            offstage: treatmentResult != 2,
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  //整改到期日期
  _getZGDQRQItem({String title, String hint, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        this.rectificationPreiodDate =
                            '${selectDate.year}-${selectDate.month < 10 ? '0' + selectDate.month.toString() : selectDate.month}-${selectDate.day < 10 ? '0' + selectDate.day.toString() : selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: RegulatoryEntryPage.itemMaginLeft),
                      child: Text(
                        rectificationPreiodDate,
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

  //分割线
  spaceWidget() {
    return Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xfff7f7f9),
    );
  }

  //检查结果附件上传
  buildJCJGJLBLayout(List itemList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        UpfileItemStateless(
            itemList, RegulatoryEntryPage.checkResultUpfileTitle),
      ],
    );
  }

  //其他附件
  buildotherUpfileLayout(List itemList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        UpfileItemStateless(itemList, RegulatoryEntryPage.otherUpfileTitle),
      ],
    );
  }

  buildTipView(bool isMandatory) {
    return Container(
      margin: EdgeInsets.only(left: RegulatoryEntryPage.itemMaginLeft),
      child: Text(
        '*',
        style: TextStyle(color: isMandatory ? Colors.red : Colors.white),
      ),
    );
  }

  //获取初始化数据
  getInitData() async {
    ResultData resultData =
        await BasicNetService().post(Api.addPatrolPage, params: {
      "superBusId": widget.superBusId,
    });
    if (resultData.resultStatue) {
      SuperBuspush superBuspush = SuperBuspush.fromJson(resultData.data);
      if (null != superBuspush) {
        Business business = superBuspush.busienss;
        //初始化办件id
        businessId = business.id;
        if (null != business) {
          Proposer proposer = business.proposer;
          if (null != proposer) {
            //服务对象类型
            serviceObject = business.serviceObject;
            //除了自然人 1，其他都按照企业执行
            if (serviceObject == '1') {
              bjcrName = proposer.userName ?? '';
              sfzhName = proposer.userCardNo ?? '';
            } else {
              bjcrName = proposer.companyName ?? '';
              sfzhName = proposer.companyNo ?? '';
            }
          }
        }
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
        await BasicNetService().post(Api.addPatrol, params: {
      "superBusId": widget.superBusId, //
      "businessId": businessId,
      "proposerName": bjcrName,
      "patrolDate": checkDate, //检查日期
      "patrolNum": jccsController.text.trim(), //检查次数
      "patrolResult": checkResult, //检查结果 1.符合 2基本符合  3不符合
      "treatmentResult": treatmentResult, //处理结果 1通过  2限期整改 3移交执法
      "rummageName": xcryController.text.trim(),
      "treatmentEndDate": rectificationPreiodDate, //整改到期日期
      "patrolResultExplain": jcjgsmController.text.trim() //检查结果说明
    });
    //提交数据成功
    if (resultData.resultStatue) {
      //发送刷新事件
      EventHelper.eventBus.fire(RegulatoryListRefreshEvent());
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

  //公示区域
  getShowArea({String title, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
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
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: SingleRadio(
                            title: '外部公示',
                            groupValue: showArea,
                            value: 0,
                            selectRadio: (value) {
                              showArea = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '内部公示',
                            groupValue: showArea,
                            value: 1,
                            selectRadio: (value) {
                              showArea = value;
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
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  bool checkInputInfo() {
    if (bjcrName.trim().length <= 0) {
      showToast('请填写被检查人姓名');
      return false;
    }
    if (sfzhName.trim().length <= 0) {
      showToast('请填写身份证号码');
      return false;
    }
    if (checkDate.trim().length <= 0) {
      showToast('请选择检查日期');
      return false;
    }
    if (jccsController.text.trim().length <= 0) {
      showToast('请填写检查次数');
      return false;
    }
    if (xcryController.text.trim().length <= 0) {
      showToast('请填写巡查人员');
      return false;
    }
    if (treatmentResult == 2) {
      if (rectificationPreiodDate.trim().length <= 0) {
        showToast('请填写整改到期日期');
        return false;
      } else {
        if (DateTime.parse(checkDate)
            .isAfter(DateTime.parse(rectificationPreiodDate))) {
          showToast('检查日期必须在整改日期之前！');
          return false;
        }
      }
    }
    if (jcjgsmController.text.trim().length <= 0) {
      showToast('检查结果说明不能为空');
      return false;
    }
    return true;
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
      margin: EdgeInsets.only(left: RegulatoryEntryPage.itemMaginLeft),
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
