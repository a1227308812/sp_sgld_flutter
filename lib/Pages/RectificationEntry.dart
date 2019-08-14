import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

import 'package:sp_sgld_flutter/Common/event/RectificationListRefreshEvent.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/modle/Business.dart';
import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Common/modle/Proposer.dart';
import 'package:sp_sgld_flutter/Common/modle/Reform.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Widgets/LoaddingDialog.dart';
import 'package:sp_sgld_flutter/Widgets/SingleRadio.dart';

/**
 * Created by ZWP on 2019/7/19 10:59.
 * 描述：整改录入详情页面
 */
class RectificationEntryPage extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  int reformId;

  RectificationEntryPage(this.reformId);

  @override
  State<RectificationEntryPage> createState() {
    return RectificationEntryState();
  }
}

class RectificationEntryState extends State<RectificationEntryPage> {
  //整改结果说明
  TextEditingController zgjgsmController = TextEditingController();

  //初始化数据
  InitDataModle initDataModle;

  //初始化数据监听器
  DataValueNotifier _valueListenable;

  @override
  void initState() {
    super.initState();
    initDataModle = InitDataModle();
    _valueListenable = DataValueNotifier(InitDataModle());
    //获取登录人员id
    Future(() async {
      String userJson =
          (await LocalStorage.getString(LocalStorageKey.user)) ?? "";
      UserInfo userInfo = UserInfo.fromJson(json.decode(userJson));
      return userInfo?.id;
    }).then((int userId) {
      initDataModle.patrolId = userId;
    });

    initDataModle.reformId = widget.reformId;
    if (null != initDataModle.reformId) {
      getInitData(initDataModle).then((InitDataModle initDataModle) {
        _valueListenable.value = initDataModle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CostomWillPopScope(
        title: '整改信息录入详情',
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
                        // 关闭页面,并返回数据用于刷新上一个页面
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
        body: ValueListenableBuilder(
            valueListenable: _valueListenable,
            builder:
                ((BuildContext context, InitDataModle value, Widget child) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    spaceWidget(),
                    _getInfoItem(title: '被检查人：', content: value.name),
                    _getInfoItem(title: '身份证号：', content: value.cardNum),
                    _getInfoItem(title: '检查日期：', content: value.checkDate),
                    _getInfoItem(title: '巡查人员：', content: value.patrolName),
                    _getInfoItem(title: '检查次数：', content: value.checkNum),
                    _getInfoItem(title: '检查结果：', content: value.checkResult),
                    _getInfoItem(
                        title: '处理结果：', content: value.treatmentResult),
                    //只有选择的期限整改才会有整改到期日期选择
                    _getInfoItem(
                        title: '整改到期日期：',
                        content: value.rectificationPreiodDate),
                    _getInfoItemForMultiple(
                        title: '检查结果说明：', content: value.checkResultExplian),
                    //分割区域
                    spaceWidget(),
                    //企业区域标题
                    getAreaTitle(),
                    _getJCJGItem(
                        title: '整改结果：',
                        selectPosition: value.rectificationResult),
                    //只有选择的继续整改才会有整改到期日期选择
                    _getZGDQRQItem(
                        title: '整改到期日期：',
                        hint: '请输入整改到期日期',
                        offstage: value.rectificationResult == 2),
                    //整改结果说明输入框
                    _getZGJGSMItem(zgjgsmController),
                    //分割区域
                    spaceWidget(),
                  ], //初始化控件数据
                ),
              );
            })));
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
  _getJCJGItem({String title, int selectPosition, bool isMandatory = true}) {
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
                            title: '整改合格',
                            groupValue: selectPosition,
                            value: 1,
                            selectRadio: (value) {
                              _valueListenable.changeRectificationResult(value);
//                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '继续整改',
                            groupValue: selectPosition,
                            value: 2,
                            selectRadio: (value) {
                              _valueListenable.changeRectificationResult(value);
//                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '移交执法',
                            groupValue: selectPosition,
                            value: 3,
                            selectRadio: (value) {
                              _valueListenable.changeRectificationResult(value);
//                              setState(() {});
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

  //整改到期日期
  _getZGDQRQItem(
      {String title, String hint, bool offstage, bool isMandatory = true}) {
    return Offstage(
      offstage: !offstage, //true 表示隐藏  false表示显示
      child: Container(
        height: RectificationEntryPage.itemHeight,
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
                          print(selectDate.toString());
                          _valueListenable.changeRectificationPreiodDateNew(
                              '${selectDate.year}-${selectDate.month < 10 ? '0' + selectDate.month.toString() : selectDate.month}-${selectDate.day < 10 ? '0' + selectDate.day.toString() : selectDate.day}');
//                        setState(() {});
                        }).catchError((error) {
                          print(error);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(20),
                            right: RectificationEntryPage.itemMaginLeft),
                        child: Text(
                          initDataModle.rectificationPreiodDateNew,
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
    ResultData resultData =
        await BasicNetService().post(Api.updateReform, params: {
      //reformId
      "id": initDataModle.reformId,
      //监管信息表id
      "patrolId": initDataModle.patrolId,
      //整改信息录入人ID
      "patrolUserId": initDataModle.patrolUserId,
      //整改结果说明
      "reformResultExplain": zgjgsmController.text.trim(),
      //整改到期日期
      "reformEndDate": initDataModle.rectificationPreiodDateNew,
      //整改结果  1整改合格  2继续整改 3移交执法
      "reformResult": initDataModle.rectificationResult,
    });
    if (resultData.resultStatue) {
      //提交数据完成
      //发送刷新事件
      EventHelper.eventBus.fire(RectificationListRefreshEvent());
      //关闭弹窗
      Navigator.pop(context);
      //关闭页面
      Navigator.pop(context);
    } else {
      showToast(resultData.data);
    }
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
      constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(800)),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
//      height: double.infinity,
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30),
              bottom: ScreenUtil().setWidth(30)),
          constraints: BoxConstraints(
            minHeight: ScreenUtil().setHeight(100),
          ),
          child: Text(
            '$content',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            maxLines: null,
          ),
        ),
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
            '整改信息录入',
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

  //请求服务器的初始化数据
  Future<InitDataModle> getInitData(InitDataModle initDataModle) async {
    ResultData resultData =
        await BasicNetService().post(Api.updateReformPage, params: {
      "reformId": initDataModle.reformId,
    });
    if (resultData.resultStatue) {
      Reform reform = Reform.fromJson(resultData.data);
      if (null != reform) {
        Patrol patrol = reform.patrol;
        if (null != patrol) {
          initDataModle.patrolId = patrol.id;
          initDataModle.patrolUserId = patrol.userId;
          initDataModle.patrolName = patrol.rummageName ?? '';
          initDataModle.checkNum = patrol.patrolNum ?? '';
          initDataModle.checkDate = patrol.patrolDate ?? '';
          initDataModle.checkResult = patrol.patrolResult == '1'
              ? '符合'
              : patrol.patrolResult == '2'
                  ? '基本符合'
                  : patrol.patrolResult == '3' ? '不符合' : '';
          initDataModle.treatmentResult = patrol.treatmentResult == '1'
              ? '通过'
              : patrol.treatmentResult == '2'
                  ? '期限整改'
                  : patrol.treatmentResult == '3' ? '移交执法' : '';
          initDataModle.rectificationPreiodDate = patrol.treatmentEndDate ?? '';
          initDataModle.checkResultExplian = patrol.patrolResultExplain ?? '';

          Business business = patrol.business;
          //初始化办件id
          if (null != business) {
            String serviceObject = business.serviceObject;
            Proposer proposer = business.proposer;
            if (null != proposer) {
              //服务对象类型
              //除了自然人，其他都按照企业执行
              if (serviceObject == '1') {
                initDataModle.name = proposer.userName ?? '';
                initDataModle.cardNum = proposer.userCardNo ?? '';
              } else {
                initDataModle.name = proposer.companyName ?? '';
                initDataModle.cardNum = proposer.companyNo ?? '';
              }
            }
          }
        }
      }
    } else {
      showToast(resultData.data);
    }

    return initDataModle;
  }

  bool checkInputInfo() {
    if (initDataModle.rectificationResult == 0) {
      showToast('请选择整改结果');
      return false;
    }
    if (initDataModle.rectificationResult == 2) {
      if (initDataModle.rectificationPreiodDateNew.trim().isEmpty) {
        showToast('请填写整改到期日期');
        return false;
      } else {
        //上传整改日期必须在本次整改日志之前
        if (DateTime.parse(initDataModle.rectificationPreiodDate).isAfter(
            DateTime.parse(initDataModle.rectificationPreiodDateNew))) {
          showToast('新录入的整改到期日期必须在上次整改到期日期之前！');
          return false;
        }
      }
    }
    if (zgjgsmController.text.trim().length <= 0) {
      showToast('请填写整改结果说明');
      return false;
    }

    return true;
  }
}

//数据属性通知器
class DataValueNotifier extends ValueNotifier<InitDataModle> {
  DataValueNotifier(InitDataModle value) : super(value);

  //设置并只刷新整改结果
  void changeRectificationResult(int rectificationResult) {
    value.rectificationResult = rectificationResult;
    notifyListeners();
  }

  //设置并只刷新整改日期
  void changeRectificationPreiodDateNew(var rectificationPreiodDate) {
    value.rectificationPreiodDateNew = rectificationPreiodDate;
    notifyListeners();
  }
}

class InitDataModle {
  /*默认不可修改数据*/
  //被检查人姓名/企业名称
  var name = '';

  //被检查人身份证号码/企业编号
  var cardNum = '';

  //检查日期
  var checkDate = '';

  //巡查人员名称
  var patrolName = '';

  //本年度第几次检查
  var checkNum = '';

  //检查结果
  var checkResult = '';

  //处理结果
  var treatmentResult = '';

  //整改到期日期 不可修改的
  String rectificationPreiodDate = '';

  //检查结果说明
  var checkResultExplian = '';

/*不可修改的请求参数*/
  int reformId = -1;

  //监管信息表id
  int patrolId = -1;

  //监管信息录入人ID
  int patrolUserId = -1;

  /*录入的请求参数*/
  //整改结果
  int rectificationResult = 1; //默认选择通过

  //新录入的整改到期日期
  String rectificationPreiodDateNew = '';
}
