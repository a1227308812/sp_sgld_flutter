import 'package:json_annotation/json_annotation.dart';

import 'BusinessCustForm.dart';
import 'Card.dart';
import 'ChargeRelation.dart';
import 'CompanyLib.dart';
import 'Delay.dart';
import 'Item.dart';
import 'ItemLicenceCatalog.dart';
import 'ItemLicenceModel.dart';
import 'ItemStuff.dart';
import 'Licence.dart';
import 'Oncetell.dart';
import 'Pause.dart';
import 'PersonLib.dart';
import 'Proposer.dart';
import 'RunFlow.dart';
import 'RunNodeLog.dart';
import 'StuffCatalog.dart';
import 'StuffRelation.dart';
import 'Supervise.dart';
import 'UserInfo.dart';

part 'Business.g.dart';

@JsonSerializable()
class Business {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 所在地区
   */

  int regId;

  /**
   * 所在部门
   */

  int depId;

  /**
   * 关联item表ID
   */

  int itemId;

  /**
   * 项目编号
   */

  String itemNo;

  /**
   * 办件数
   */

  String donum;

  /**
   * 受理编号
   */

  String slbh;

  /**
   * 受理日期
   */

  String acceptDate;

  /**
   * 受理时间
   */

  String acceptTime;

  /**
   * 办结日期
   */

  String doDate;

  /**
   * 办结时间
   */

  String doTime;

  /**
   * 节省工作日
   */

  int saveTheDay;

  /**
   * 预警日期
   */

  String warningDate;

  /**
   * 承诺日期
   */

  String consentDate;

  /**
   * 法定日期
   */

  String legalDate;

  /**
   * 办理状态
   */

  String itemdoState;

  /**
   * 办结标志1是0否
   */

  String bjbz;

  /**
   * 申请人Id
   */

  int proposerId;

  /**
   * 受理人Id
   */

  int acceptUserId;

  /**
   * 办结人Id
   */

  int doUserId;

  /**
   * 是否取件 1是0否
   */

  String ispick;

  /**
   * 办件流程实例
   */

  int runFlowId;

  /**
   * 收费状态 0为不收费 1为未收费 2为已收费
   */

  String chargeState;

  /**
   * 实收金额
   */

  String chargeMoney;

  /**
   * 事项类型
   */

  String itemCategory;

  /**
   * 办件类型
   */

  String itemType;

  /**
   * 一次性告知状态 0为未补办 1为补办 中2为已启动
   */

  String oncetellState;

  /**
   * 应收金额
   */

  String shouldMoney;

  /**
   * 网上预审Id
   */

  int webApplyId;

  /**
   * 申请人类别1：自然人2：法人
   * 字典表地址：http://192.168.1.77:83/datadic/classes/datadic.xml
   */

  String serviceObject;

  /**
   * 取件时间
   */

  String fetchTime;

  /**
   * 是否接收
   */

  String isReceive;

  /**
   * 接收时间
   */

  String receivTime;

  /**
   * 认领人Id
   */

  int receiveUserId;

  /**
   * 认领IP
   */

  String receivIpInfo;

  /**
   * 是否推送0是，1否，2不推送
   */

  String isPush;

  /**
   * 推送时间
   */

  String pushDate;

  /**
   * 是否已经打证0否1是
   */

  String isPrint;

  /**
   * 并联审批办件编号
   */

  int uniteBusinessId;

  /**
   * 取件方式（现场取件，邮寄取件）
   */

  int pickUp;

  /**
   * 取件人姓名
   */

  String pickUpUserName;

  /**
   * 取件人地址
   */

  String pickUpAddress;

  /**
   * 取件人电话
   */

  String pickUpPhone;

  /**
   * 快递编号
   */

  String expressNumber;

  /**
   * 快递方式（默认邮政ems）
   */

  int expressType;

  /**
   * uuid
   */

  String rowGuid;

  /**
   * 自治区规则的办件编号
   */

  String projectNo;

  /**
   * 同步标识受理
   */

  String cdSignAccept;

  /**
   * 同步标识办结
   */

  String cdSignEnd;

  /**
   * 自治区编号是否已经生成
   */

  String projectNoState;

  /**
   * 邮编
   */

  String postalCode;

  /**
   * 附页信息
   */

  String appendixInfo;

  /****************以上主要为系统表字段********************/

  Proposer proposer;

  /**
   * 企业信息
   */
  CompanyLib companyLib;

  /**
   * 企业社会信用编码
   */
  String companyno;

  /**
   * 人员信息
   */
  PersonLib personLib;

  /**
   * 申请人姓名,用于类表查询
   */
  String proposerName;

  /**
   * 申请人身份证号码，用于查询
   */
  String cardNo;

  String linkUserName;

  /**
   * 办理人电话
   */
  String phone;

  /**
   * 父级行政区划
   */
  int parentRegId;

  String itemName;

  String regName;

  String depName;

  /**
   * 执法监管部门
   */
  int zfjgDepId;

  /**
   * 执法监管部门
   */
  String zfjgDepName;

  String acceptUserName;

  /**
   * 认领人
   */
  String receiveUserName;

  String itemWarState;

  String nodeWarState;

  String doResultState;

  String doResultSituation;

  List<int> stuffIds;

  List<ItemStuff> listStuff;

  /**
   * 容缺材料
   */
  List<ItemStuff> listItemStuffNotUpload;

  int stuffRelationId;

  List<StuffRelation> listStuffRelation;

  int stuffFileIds;

  /**
   * 证照列表
   */
  List<Licence> listLicence;

  /**
   * 二维码存放路径
   */
  String qRCodeUrl;

  /**
   * 流程信息
   */
  int flowId;

  /**
   * 当前流程日志id
   */
  int logId;

  /**
   * 当前环节名称
   */
  String nowNodeName;

  /**
   * 上报到该项目
   */
  int toItemId;

  /**
   * 上报到该项目
   */
  String toItemName;

  /**
   * 当前节点类别
   */
  String thisNodeType;

  Item item;

  RunFlow runFlow;

  RunNodeLog log;

  List<Card> listCard;

  List<Supervise> listSupervise;

  List<ChargeRelation> listChargeRe;

  List<Delay> listDelay;

  List<Pause> listPause;

  List<Oncetell> listOncetell;

  List<ItemLicenceModel> listItemLicenceModel;

  /**
   * 办件自定义表单
   */
  List<BusinessCustForm> listCustForm;

  String itemdoStateIn;

  String businessDoInfo;

  String chargeType;

  /**
   * doBusiness.jsp中，c:if判断时无法把string转换成int，使用这个字段
   */
  double chargeMoneyFloat;

  String isOncetell;

  Oncetell oncetell;

  String oncetellId;

  String oncetellStime;

  String oncetellOvertime;

  String doUserName;

  String delayId;

  String delayAcceptTime;

  String delayDayNum;

  String verifyUserName;

  String pauseId;

  String pauseAcceptTime;

  UserInfo userinfo;

  int redNum;

  int yellowNum;

  int hurryNum;

  int warningNum;

  String sdate;

  String edate;

  String dosdate;

  String doedate;

  String derateMoney;

  String sendbackMoney;

  String factMoney;

  String auditResults;

  String oncetellLightState;

  String userId;

  String userName;

  String companyName;

  Map<String, String> valueMap;

  int stuffCatalogId;

  List<StuffCatalog> listStuffCatalog;

  int firstBusinessId;

  int firstItemId;

  /**
   * 上报情况
   */
  int upBusinessId;

  /**
   * 流程日志
   */
  List<RunNodeLog> listRunNodeLog;

  /**
   * 状态图片
   */
  String statePng;

  /**
   * 企业设立项目关联
   */
  int applicantItemId;

  /**
   * 办件来源0：所有1：下级上报2：企业设立3：建设项目
   */
  String source;

  /**
   * 建设项目办理状态
   */
  int investItemStateId;

  /**
   * 建设项目阶段办理状态
   */
  int investStepStateId;

  /**
   * 评议结果
   */
  String appraiseType;

  /**
   * 取号信息
   */
  int callRegisterId;

  /**
   * 业务办理首页查询办件的参数
   */
  String serchName;

  /**
   * 服务对象名称
   */
  String serviceObjectName;

  /**
   * 是否为监管部门查看办件1是0否
   */
  String isPatrolShow;

  /**
   * 跑路次数
   */
  int runNum;

  String uniteStageName;

  int consentLimit;

  String expressTypeName;

  String slbhOrCardNo;

  String itemdoStateCN;

  String handleNodeContent;

  String saveDayNotHasHoliday;

  /**
   * 是否已评价 1：是  0：否 用于手机App
   */
  String appraised;

  List<ItemLicenceCatalog> listItemLicenceCatalog;

  /**
   * 是否自动受理之后就办结只针对即办件
   */
  String isAutoDone;

  /**
   * 省上交换过来的实施编码
   */
  String taskCode;

  /**
   * 事项办理编号
   */
  String taskHandleItem;

  /****************以上为自己添加字段********************/

  Business(
      this.id,
      this.recordCreateTime,
      this.regId,
      this.depId,
      this.itemId,
      this.itemNo,
      this.donum,
      this.slbh,
      this.acceptDate,
      this.acceptTime,
      this.doDate,
      this.doTime,
      this.saveTheDay,
      this.warningDate,
      this.consentDate,
      this.legalDate,
      this.itemdoState,
      this.bjbz,
      this.proposerId,
      this.acceptUserId,
      this.doUserId,
      this.ispick,
      this.runFlowId,
      this.chargeState,
      this.chargeMoney,
      this.itemCategory,
      this.itemType,
      this.oncetellState,
      this.shouldMoney,
      this.webApplyId,
      this.serviceObject,
      this.fetchTime,
      this.isReceive,
      this.receivTime,
      this.receiveUserId,
      this.receivIpInfo,
      this.isPush,
      this.pushDate,
      this.isPrint,
      this.uniteBusinessId,
      this.pickUp,
      this.pickUpUserName,
      this.pickUpAddress,
      this.pickUpPhone,
      this.expressNumber,
      this.expressType,
      this.rowGuid,
      this.projectNo,
      this.cdSignAccept,
      this.cdSignEnd,
      this.projectNoState,
      this.postalCode,
      this.appendixInfo,
      this.proposer,
      this.companyLib,
      this.companyno,
      this.personLib,
      this.proposerName,
      this.cardNo,
      this.linkUserName,
      this.phone,
      this.parentRegId,
      this.itemName,
      this.regName,
      this.depName,
      this.zfjgDepId,
      this.zfjgDepName,
      this.acceptUserName,
      this.receiveUserName,
      this.itemWarState,
      this.nodeWarState,
      this.doResultState,
      this.doResultSituation,
      this.stuffIds,
      this.listStuff,
      this.listItemStuffNotUpload,
      this.stuffRelationId,
      this.listStuffRelation,
      this.stuffFileIds,
      this.listLicence,
      this.qRCodeUrl,
      this.flowId,
      this.logId,
      this.nowNodeName,
      this.toItemId,
      this.toItemName,
      this.thisNodeType,
      this.item,
      this.runFlow,
      this.log,
      this.listCard,
      this.listSupervise,
      this.listChargeRe,
      this.listDelay,
      this.listPause,
      this.listOncetell,
      this.listItemLicenceModel,
      this.listCustForm,
      this.itemdoStateIn,
      this.businessDoInfo,
      this.chargeType,
      this.chargeMoneyFloat,
      this.isOncetell,
      this.oncetell,
      this.oncetellId,
      this.oncetellStime,
      this.oncetellOvertime,
      this.doUserName,
      this.delayId,
      this.delayAcceptTime,
      this.delayDayNum,
      this.verifyUserName,
      this.pauseId,
      this.pauseAcceptTime,
      this.userinfo,
      this.redNum,
      this.yellowNum,
      this.hurryNum,
      this.warningNum,
      this.sdate,
      this.edate,
      this.dosdate,
      this.doedate,
      this.derateMoney,
      this.sendbackMoney,
      this.factMoney,
      this.auditResults,
      this.oncetellLightState,
      this.userId,
      this.userName,
      this.companyName,
      this.valueMap,
      this.stuffCatalogId,
      this.listStuffCatalog,
      this.firstBusinessId,
      this.firstItemId,
      this.upBusinessId,
      this.listRunNodeLog,
      this.statePng,
      this.applicantItemId,
      this.source,
      this.investItemStateId,
      this.investStepStateId,
      this.appraiseType,
      this.callRegisterId,
      this.serchName,
      this.serviceObjectName,
      this.isPatrolShow,
      this.runNum,
      this.uniteStageName,
      this.consentLimit,
      this.expressTypeName,
      this.slbhOrCardNo,
      this.itemdoStateCN,
      this.handleNodeContent,
      this.saveDayNotHasHoliday,
      this.appraised,
      this.listItemLicenceCatalog,
      this.isAutoDone,
      this.taskCode,
      this.taskHandleItem);

  factory Business.fromJson(Map<String, dynamic> srcJson) =>
      _$BusinessFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}
