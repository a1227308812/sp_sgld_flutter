import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/modle/Apparitor.dart';
import 'package:sp_sgld_flutter/Common/modle/Business.dart';
import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Common/modle/Proposer.dart';
import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/7/19 10:59.
 * 描述：综合查询详情
 */
class IntegratedQueryDetail extends StatefulWidget {
  //0表示监管  1表示执法
  int type = 0;
  int id;

  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  IntegratedQueryDetail(this.id, this.type);

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

  //初始化数据监听器
  DataValueNotifier _valueListenable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _valueListenable = DataValueNotifier(InitDataModle());
    //初始化数据
    if (0 == widget.type) {
      getInitDataForPatrol().then((InitDataModle initDataModle) {
        //获取到异步返回的初始化数据，刷新界面数据
        _valueListenable.value = initDataModle;
      });
    } else {
      getInitDataForApparitor().then((InitDataModle initDataModle) {
        //获取到异步返回的初始化数据，刷新界面数据
        _valueListenable.value = initDataModle;
      });
    }
  }

  //获取监管信息
  Future<InitDataModle> getInitDataForPatrol() async {
    InitDataModle initDataModle = InitDataModle();
    ResultData resultData =
        await BasicNetService().post(Api.showPatrolPage, params: {
      "patrolId": widget.id,
    });
    if (resultData.resultStatue) {
      Patrol patrol = Patrol.fromJson(resultData.data);
      if (null != patrol) {
        initDataModle.checkNum = patrol.patrolNum;
        initDataModle.checkDate = patrol.patrolDate;
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
        //检查结果说明
        initDataModle.checkResultExplian = patrol.patrolResultExplain ?? '';
        //巡查人员名称
        initDataModle.operationName = patrol.rummageName;
        //整改到期日期
        initDataModle.rectificationPreiodDate = patrol.treatmentEndDate;

        Business business = patrol.business;
        //初始化办件id
        if (null != business) {
          //服务对象
          initDataModle.serviceObject = business.serviceObject;
          Proposer proposer = business.proposer;
          if (null != proposer) {
            //服务对象类型
            //除了自然人，其他都按照企业执行
            if (initDataModle.serviceObject == '1') {
              initDataModle.name = proposer.userName;
              initDataModle.cardNum = proposer.userCardNo;
            } else {
              initDataModle.name = proposer.companyName;
              initDataModle.cardNum = proposer.companyNo;
            }
          }
        }
      }
    } else {
      showToast(resultData.data);
    }
    return initDataModle;
  }

  //获取执法信息
  Future<InitDataModle> getInitDataForApparitor() async {
    InitDataModle initDataModle = InitDataModle();
    ResultData resultData =
        await BasicNetService().post(Api.showApparitorPage, params: {
      "apparitorId": widget.id,
    });
    if (resultData.resultStatue) {
      Apparitor apparitor = Apparitor.fromJson(resultData.data);
      if (null != apparitor) {
        //执法日期
        initDataModle.checkDate = apparitor.apparitorDate;
        //执法人员名称
        initDataModle.operationName = apparitor.apparitorName;
        /**
         * <DataDic code="0" zvalue="警告"/>
            <DataDic code="1" zvalue="罚款"/>
            <DataDic code="2" zvalue="行政拘留"/>
            <DataDic code="3" zvalue="吊销"/>
            <DataDic code="4" zvalue="收缴和追缴"/>
            <DataDic code="5" zvalue="其它"/>
         */
        //执法结果
        switch (apparitor.penaltyResult) {
          case '0':
            initDataModle.checkResult = '警告';
            break;
          case '1':
            initDataModle.checkResult = '罚款';
            break;
          case '2':
            initDataModle.checkResult = '行政拘留';
            break;
          case '3':
            initDataModle.checkResult = '吊销';
            break;
          case '4':
            initDataModle.checkResult = '收缴和追缴';
            break;
          case '5':
            initDataModle.checkResult = '其它';
            break;
        }
        //执法结果说明
        initDataModle.checkResultExplian =
            apparitor.apparitorResultExplain ?? '';

        Business business = apparitor.business;
        //初始化办件id
        if (null != business) {
          //服务对象
          String serviceObject = business.serviceObject;
          Proposer proposer = business.proposer;
          if (null != proposer) {
            //服务对象类型
            //除了自然人，其他都按照企业执行
            if (serviceObject == '1') {
              initDataModle.name = proposer.userName;
              initDataModle.cardNum = proposer.userCardNo;
            } else {
              initDataModle.name = proposer.companyName;
              initDataModle.cardNum = proposer.companyNo;
            }
          }
        }
      }
    } else {
      showToast(resultData.data);
    }
    return initDataModle;
  }

  @override
  Widget build(BuildContext context) {
    return CostomWillPopScope(
      title: '综合查询详情',
      bodyColor: 0xfff7f7f9,
      body: ValueListenableBuilder(
          valueListenable: _valueListenable,
          builder: (BuildContext context, InitDataModle value, Widget child) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  spaceWidget(),
                  _getInfoItem(
                      title: '${value.serviceObject != 1 ? '单位名称' : '姓名'}：',
                      content: value.name),
                  _getInfoItem(
                      title: '${value.serviceObject != 1 ? '证件号码' : '身份证号'}：',
                      content: value.cardNum),
                  _getInfoItem(
                      title: widget.type == 0
                          ? '检查日期：'
                          : widget.type == 1 ? '执法日期：' : '',
                      content: value.checkDate),
                  _getInfoItem(
                      title: widget.type == 0
                          ? '巡查人员：'
                          : widget.type == 1 ? '执法人员：' : '',
                      content: value.operationName),
                  _getInfoItem(
                      title: '检查次数：',
                      content: value.checkNum,
                      show: widget.type == 1),
                  _getInfoItem(
                      title: widget.type == 0
                          ? '检查结果：'
                          : widget.type == 1 ? '执法结果：' : '',
                      content: value.checkResult),
                  _getInfoItem(
                      title: '处理结果：',
                      content: value.treatmentResult,
                      show: widget.type == 1),
                  //只有选择的期限整改才会有整改到期日期选择
                  _getInfoItem(
                      title: '整改到期日期：',
                      content: value.rectificationPreiodDate,
                      show: widget.type == 1),
                  _getInfoItemForMultiple(
                      title: widget.type == 0
                          ? '检查结果说明：'
                          : widget.type == 1 ? '执法结果说明：' : '',
                      content: value.checkResultExplian),
                ], //初始化控件数据
              ),
            );
          }),
    );
  }

  _getInfoItem({String title, String content, bool show = false}) {
    return Offstage(
      offstage: show,
      child: Container(
        height: IntegratedQueryDetail.itemHeight,
        color: Colors.white,
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

//不可修改的检查结果说明
  _getInfoItemForMultiple({String title, String content}) {
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Container(
      margin: EdgeInsets.only(left: IntegratedQueryDetail.itemMaginLeft),
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(80)),
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
    return Container(
      color: Colors.white,
      child: Column(
        children: widgetList,
      ),
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

//数据属性通知器
class DataValueNotifier extends ValueNotifier<InitDataModle> {
  DataValueNotifier(InitDataModle value) : super(value);
}

class InitDataModle {
  /*默认不可修改数据*/
  /*公共参数*/
  //服务对象  除了自然人 1，其他都按照企业执行
  var serviceObject;

  //被检查人姓名/企业名称
  var name = '';

  //被检查人身份证号码/企业编号
  var cardNum = '';

  //检查日期/执法日期
  var checkDate = '';

  //本年度第几次检查  如果是执法信息，就没有检查次数，直接隐藏检查次数的显示
  var checkNum = '';

  //检查结果/执法结果
  var checkResult = '';

  //执法信息 = 执法人员名称/监管信息 = 巡查人员名称
  var operationName = '';

  //检查结果说明/执法结果说明
  var checkResultExplian = '';

  //处理结果  只有监管信息才有
  var treatmentResult = '';

  //整改到期日期  只有监管信息才有
  String rectificationPreiodDate = '';
}
