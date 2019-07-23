import 'package:json_annotation/json_annotation.dart';

import 'ItemLicenceCatalog.dart';
import 'ItemLicenceModel.dart';
import 'ItemStuff.dart';
import 'StuffCatalog.dart';
import 'Upfiles.dart';
import 'UserInfo.dart';

part 'Item.g.dart';

@JsonSerializable()
class Item {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 基本编码（同步目录清单基本编码）
   */

  String baseCode;

  /**
   * 实施编码
   */

  String itemNo;

  /**
   * 事项名称
   */

  String itemName;

  /**
   * 项目名称拼音全拼
   */

  String allSpelling;

  /**
   * 项目名称拼音首字母
   */

  String firstSpelling;

  /**
   * 项目所在地区
   */

  int regId;

  /**
   * 实施机构
   */

  int depId;

  /**
   * 监管执法单位
   */

  int jgzfDepId;

  /**
   * 是否外网显示
   */

  String isWebShow;

  /**
   * 网上办理深度
   */

  String webDoDepth;

  /**
   * 受理是否给申请人发送短信
   */

  String isSlSMS;

  /**
   * 办结是否给申请人发送短信
   */

  String isBjSMS;

  /**
   * 是否支持预约办理
   */

  String isOrder;

  /**
   * 事项类型
   */

  String itemCategory;

  /**
   * 办件类型
   */

  String itemType;

  /**
   * 主题分类 公民
   */

  String themeCitizen;

  /**
   * 主题分类 企业
   */

  String themeCompany;

  /**
   * 服务对象  1自然人 2法人3其他组织
   */

  String serviceObject;

  /**
   * 办理地点
   */

  String doAddress;

  /**
   * 咨询电话
   */

  String consultPhone;

  /**
   * 监督电话
   */

  String complaintPhone;

  /**
   * 行使层级,参考字典表exeLevel
   */

  String exeLevel;

  /**
   * 设定依据
   */

  String setBasis;

  /**
   * 受理条件
   */

  String applycon;

  /**
   * 权限划分
   */

  String authorityDivision;

  /**
   * 行使内容
   */

  String exeContent;

  /**
   * 办理流程
   */

  String doPro;

  /**
   * 常见问题
   */

  String question;

  /**
   * 实施主体性质,参考字典表orgNature
   */

  String orgNature;

  /**
   * 联办机构
   */

  String unionOrg;

  /**
   * 中介服务
   */

  String agencyService;

  /**
   * 数量限制
   */

  String numLimit;

  /**
   * 是否收费
   */

  String ifcharge;

  /**
   * 不收费是否可以办结
   */

  String isNoChargeDo;

  /**
   * 收费标准
   */

  String chargelist;

  /**
   * 版本号
   */

  String version;

  /**
   * 收费依据
   */

  String chargeBasis;

  /**
   * 权力更新类型，参考字典表powerType
   */

  String powerType;

  /**
   * 权力状态，参考字典表powerState
   */

  String powerState;

  /**
   * 是否使用（只有审核通过和该字段为1的时候这个事项才能被受理）
   */

  String enabled;

  /**
   * 是否提交审核
   */

  String isVerify;

  /**
   * 审核状态0未审核1审核通过2审核未通过
   */

  String verifyState;

  /**
   * 收费类别
   */

  String chargeType;

  /**
   * 呼叫号
   */

  String callType;

  /**
   * 跳转链接
   */

  String jumpUrl;

  /**
   * 认领期限
   */

  String acceptLimit;

  /**
   * 是否推送
   */

  String isPush;

  /**
   * 推送内容
   */

  String pushContent;

  /**
   * 是否需要打证
   */

  String isPrint;

  /**
   * 是否入住大厅
   */

  String isHall;

  /**
   * 优先级 0最低
   */

  int callPrior;

  /**
   * 法定办结时限
   */

  int legalLimit;

  /**
   * 承诺办结时限
   */

  int consentLimit;

  /**
   * 结果名称
   */

  String resultName;

  /**
   * 结果样本
   */

  String resultSample;

  /**
   * 通办范围,参考字典表opeScope
   */

  String opeScope;

  /**
   * 办理形式,参考字典表dealType
   */

  String dealType;

  /**
   * 是否支持网上支付
   */

  String isPay;

  /**
   * 是否支持物流快递
   */

  String isExpress;

  /**
   * 运行系统,参考字典表runSystem
   */

  String runSystem;

  /**
   * 办理时间
   */

  String processTime;

  /**
   * 内部流程描述
   */

  String processDescription;

  /**
   * 版本生效时间
   */

  String effectTime;

  /**
   * 自定义表单ID
   */

  String custFormIds;

  /**
   * 事项来源
   */

  String itemFrom;

  /**
   * 更新时间
   */

  String updateDate;

  /**
   * 限制取号数
   */

  int limitNum;

  /**
   * 每人每日最大取号数量
   */

  int personNum;

  /**
   * 每一个手机号每日最大取号数量
   */

  int telLimitNum;

  /**
   * 预审时限
   */

  int webapplyLimit;

  /**
   * 跑路次数
   */

  int runNum;

  /**
   * 达到取号限制后是否自动预约0否1是
   */

  String isAutoBespeak;

  /**
   * 取号截止时间，默认为下班时间
   */

  String quhaoEndTime;

  /**
   * 取号提示信息，用于在点击取号按钮的时候给出提示
   */

  String quhaoTip;

  /**
   * 业务窗口办理时间
   */

  int doTime;

  /**
   * 是否在取号机上显示
   */

  String isQuhaojiShow;

  /**
   * 取号排序
   */

  int quhaoOrder;

  /**
   * 取号时是否输入手机号0否1是
   */

  String isInputTel;

  /**
   * 生命周期 个人
   */

  String lifeCycleCitizen;

  /**
   * 事项版本 从省上交换过来的版本号
   */

  int taskVersion;

  /**
   * 省上交换过来的实施编码
   */

  String taskCode;

  /**
   * 业务办理项编码
   */

  String taskHandleItem;

  /**
   * 是否有业务办理项编码
   */

  String isTaskHandleItem;

  /**
   * 是否是通过数据交换过来的数据
   */

  String isClaim;

  /**
   * 行政复议部门名称
   */

  String reconsiderOuname;

  /**
   * 行政复议地址
   */

  String reconsiderAddress;

  /**
   * 行政复议联系方式
   */

  String reconsiderContact;

  /**
   * 行政诉讼部门名称
   */

  String litigationOuname;

  /**
   * 行政诉讼地址
   */

  String litigationAddress;

  /**
   * 行政诉讼联系方式
   */

  String litigationContact;

  /**
   * 处罚的行为、种类、幅度
   */

  String punishmentMethod;

  /**
   * 征收种类
   */

  String collectType;

  /**
   * 是否涉及征收(税)费减免的审批
   */

  String isPermitReduce;

  /**
   * 自治区交换过来的事项基本信息rowGuid
   */

  String taskGuid;

  /**
   * 自治区交换过来的事项基本实施主体名称
   */

  String taskOrgName;

  /**
   * 实施主体编码
   */

  String taskDeptCode;

  /**
   * 事项完整性
   */

  String integrity;

  /**
   * 是否禁用
   */

  String forbidden;

  /**
   * 临时字段
   */

  String testTemp;

  /**
   * 生命周期 企业
   */

  String lifeCycleCompany;

  /****************以上主要为系统表字段********************/

  /**
   * 叫号人
   */
  int callUserId;

  String regName;

  String depName;

  /**
   * 监管执法单位
   */
  String jgzfDepName;

  /**
   * 目录名称
   */
  String directoryListName;

  List<Upfiles> listUpFiles;

  List<Upfiles> listWordUpFiles;

//  List<ItemCharge> listCharge;

  List<ItemStuff> listStuff;

  List<StuffCatalog> listStuffCatalog;

//  /**
//   * 样表附件信息
//   */
//  List<ItemSampleFile> listSampleFile;

  List<Item> listVersion;

//  List<Flow> listFlow;

  List<UserInfo> listAccoptUser;

//  List<ItemVerifyLog> listItemVerifyLog;

  List<ItemLicenceModel> listLicenceModel;

  String doDepName;

  int sessionUserId;

  String warningDate;

  String consentDate;

  String legalDate;

  /**
   * 预审时限日期
   */
  String webApplyDate;

  int warningLimit;

  /**
   * 查询多个部门的事项，参数用数组传递
   */

  List<int> depIds;

  /**
   * 节点ID
   */
  int nodeid;

  String acceptType;

  int businessId;

  /**
   * 事项的所有流程是否完整（只要一个流程不完整就算不完整）
   */
  String isAllFlowComplete;

  /**
   * 总申请数量
   */
  String allNum;

  /**
   * 未审核数量
   */
  String wshNum;

  /**
   * 审核通过数量
   */
  String tgNum;

  /**
   * 审核未通过数量
   */
  String wtgNum;

  /**
   * 受理数量
   */
  String acceptNum;

  /**
   * 通过率
   */
  String tgl;

  /**
   * 受理率
   */
  String sll;

  /**
   * 主题
   */
  String themes;

  /**
   * 叫号窗口
   */
  int callWindowId;

  /**
   * 叫号窗口号
   */
  String callWindowStr;

  /**
   * 叫号区域
   */
  int callAreaId;

  /**
   * 0未勾选1勾选
   */
  String checked;

  /**
   * 项目首节点受理人员姓名
   */
  String acceptUsernames;

  /**
   * 样表数量
   */
  int sampleNum;

  /**
   * 取号目录
   */
  int callCatalogId;

  /**
   * 事项服务对象（次字段是用于页面表单显示和各种判断使用的字段）
   */
  String serviceObjectChoose;

  /**
   * 服务对象中文,在微信端显示使用
   */
  String serviceObjectCh;

  /**
   * 等待呼叫的数量
   */
  int waitNum;

  /**
   * 很满意的数量
   */
  int hmys;

  /**
   * 满意的数量
   */
  int mys;

  /**
   * 基本满意的数量
   */
  int jbmys;

  /**
   * 不满意的数量
   */
  int bmys;

  /**
   * 很不满意的数量
   */
  int hbmys;

  /**
   * 查询日期
   */
  String cxdate;

  /**
   * 日预约数量
   */
  int dayNum;

  /**
   * 已预约数量
   */
  int hasNum;

//  List<BespeakNum> listBespeakNum;

  /**
   * 登记状态(0:未呼叫  1:已呼叫  2:已受理   3:作废)
   */
  String registerState;

  /**
   * 今日取号数量
   */
  int quhaoNum;

  /**
   * 是否收藏
   */
  String isCollect;

  /**
   * 收藏id
   */
  int userCollectionId;

  /**
   * 当前事项是否已经过了取号截止时间
   */
  String isOverQuhaoTime;

  /**
   * 下一个转办事项的名称
   */
  String nextItemName;

  /**
   * 查询类型
   */
  String type;

  /**
   * 窗口人员列表
   */
  List<UserInfo> listWindowUser;

//  /**
//   * 网站用户登录对象
//   */
//  UiasWebUser uiasWebUser;

  List<ItemLicenceCatalog> listLicenceCatalog;

  /**
   * 事项所在区域名称
   */
  String callAreaName;

  /**
   * 是否有窗口办理此事项 0木有  1 有
   */
  String hasCallwindow;

  /**
   * 行业监管推送
   */
  List<UserInfo> listHyjgUser;

  /**
   * 行政执法推送
   */
  List<UserInfo> listXzzfUser;

//  /**
//   * 自定义表单
//   */
//  List<WebApplyCustForm> webForms;

  /**
   * 目录名称
   */
  String catalogName;

  /**
   * 服务对象类型 仅用于办事人app
   */
  String serviceObjectType;

  /****************以上为自己添加字段********************/

  Item(
      this.id,
      this.recordCreateTime,
      this.baseCode,
      this.itemNo,
      this.itemName,
      this.allSpelling,
      this.firstSpelling,
      this.regId,
      this.depId,
      this.jgzfDepId,
      this.isWebShow,
      this.webDoDepth,
      this.isSlSMS,
      this.isBjSMS,
      this.isOrder,
      this.itemCategory,
      this.itemType,
      this.themeCitizen,
      this.themeCompany,
      this.serviceObject,
      this.doAddress,
      this.consultPhone,
      this.complaintPhone,
      this.exeLevel,
      this.setBasis,
      this.applycon,
      this.authorityDivision,
      this.exeContent,
      this.doPro,
      this.question,
      this.orgNature,
      this.unionOrg,
      this.agencyService,
      this.numLimit,
      this.ifcharge,
      this.isNoChargeDo,
      this.chargelist,
      this.version,
      this.chargeBasis,
      this.powerType,
      this.powerState,
      this.enabled,
      this.isVerify,
      this.verifyState,
      this.chargeType,
      this.callType,
      this.jumpUrl,
      this.acceptLimit,
      this.isPush,
      this.pushContent,
      this.isPrint,
      this.isHall,
      this.callPrior,
      this.legalLimit,
      this.consentLimit,
      this.resultName,
      this.resultSample,
      this.opeScope,
      this.dealType,
      this.isPay,
      this.isExpress,
      this.runSystem,
      this.processTime,
      this.processDescription,
      this.effectTime,
      this.custFormIds,
      this.itemFrom,
      this.updateDate,
      this.limitNum,
      this.personNum,
      this.telLimitNum,
      this.webapplyLimit,
      this.runNum,
      this.isAutoBespeak,
      this.quhaoEndTime,
      this.quhaoTip,
      this.doTime,
      this.isQuhaojiShow,
      this.quhaoOrder,
      this.isInputTel,
      this.lifeCycleCitizen,
      this.taskVersion,
      this.taskCode,
      this.taskHandleItem,
      this.isTaskHandleItem,
      this.isClaim,
      this.reconsiderOuname,
      this.reconsiderAddress,
      this.reconsiderContact,
      this.litigationOuname,
      this.litigationAddress,
      this.litigationContact,
      this.punishmentMethod,
      this.collectType,
      this.isPermitReduce,
      this.taskGuid,
      this.taskOrgName,
      this.taskDeptCode,
      this.integrity,
      this.forbidden,
      this.testTemp,
      this.lifeCycleCompany,
      this.callUserId,
      this.regName,
      this.depName,
      this.jgzfDepName,
      this.directoryListName,
      this.listUpFiles,
      this.listWordUpFiles,
//      this.listCharge,
      this.listStuff,
      this.listStuffCatalog,
//      this.listSampleFile,
      this.listVersion,
//      this.listFlow,
      this.listAccoptUser,
//      this.listItemVerifyLog,
      this.listLicenceModel,
      this.doDepName,
      this.sessionUserId,
      this.warningDate,
      this.consentDate,
      this.legalDate,
      this.webApplyDate,
      this.warningLimit,
      this.depIds,
      this.nodeid,
      this.acceptType,
      this.businessId,
      this.isAllFlowComplete,
      this.allNum,
      this.wshNum,
      this.tgNum,
      this.wtgNum,
      this.acceptNum,
      this.tgl,
      this.sll,
      this.themes,
      this.callWindowId,
      this.callWindowStr,
      this.callAreaId,
      this.checked,
      this.acceptUsernames,
      this.sampleNum,
      this.callCatalogId,
      this.serviceObjectChoose,
      this.serviceObjectCh,
      this.waitNum,
      this.hmys,
      this.mys,
      this.jbmys,
      this.bmys,
      this.hbmys,
      this.cxdate,
      this.dayNum,
      this.hasNum,
//      this.listBespeakNum,
      this.registerState,
      this.quhaoNum,
      this.isCollect,
      this.userCollectionId,
      this.isOverQuhaoTime,
      this.nextItemName,
      this.type,
      this.listWindowUser,
//      this.uiasWebUser,
      this.listLicenceCatalog,
      this.callAreaName,
      this.hasCallwindow,
      this.listHyjgUser,
      this.listXzzfUser,
//      this.webForms,
      this.catalogName,
      this.serviceObjectType);

  factory Item.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
