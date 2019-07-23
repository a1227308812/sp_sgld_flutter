import 'package:json_annotation/json_annotation.dart';

part 'RunNodeLog.g.dart';

@JsonSerializable()
class RunNodeLog {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 节点名称
   */

  String nodename;

  /**
   * 实际流程处理人
   */

  int doUserId;

  /**
   * 开始时间
   */

  String stime;

  /**
   * 结束时间
   */

  String etime;

  /**
   * 处理意见
   */

  String nodeContent;

  /**
   * 上一步日志ID
   */

  int backLogId;

  /**
   * 处理方式(0:处理中 ,1:已处理（会签告知） ,next:往下一步流转了,end:流程结束,back:返回上一步  return:退回流程提交人)
   */

  String dotype;

  /**
   * 日志类别 0正常工作流流转日志 1会签处理日志 2告知处理日志
   */

  String logType;

  /**
   * 如果日志为会签或者告知  指定发起会签或告知的流程日志节点
   */

  int logid;

  /**
   * 发起会签 告知 时的意见
   */

  String signInformContent;

  /**
   * 流程状态 0处理中 其他为各种办结方式
   */

  String endType;

  /**
   * 流程  ID
   */

  int flowId;

  /**
   * 流程节点ID
   */

  int nodeId;

  /**
   * 流程 实例  ID
   */

  int runFlowId;

  /**
   * 根据环节时限计算的到期时间
   */

  String doDateTime;

  /**
   * uuid
   */

  String rowGuid;

  /**
   * 同步标识
   */

  String cdSign;

  /**
   * 预警时间
   */

  String warningDateTime;

  /****************以上主要为系统表字段********************/

  /**
   * 项目受理人
   */
  int acceptUserId;

  /**
   * 当前节点
   */
  int thisNodeId;

  /**
   * 当前节点实例
   */
  int thisRunNodeId;

//  /**
//   * 下一环节候选节点
//   */
//  List<Node> listNextNode;
//
//  /**
//   * 流程流转时选中的人
//   */
//  List<UserInfo> listUser;
//
//  /**
//   * 流程流转时提交的附件
//   */
//  List<Upfiles> listFile;

  /**
   * 节点处理人
   */
  String doUserName;

  /**
   * 节点处理人办公电话
   */
  String officePhone;

  /**
   * 节点处理人所在区划名称
   */
  String regName;

  /**
   * 节点处理人所在部门名称
   */
  String depName;

  /**
   * 会签
   */
  List<RunNodeLog> listSignLog;

  /**
   * 告知信息
   */
  List<RunNodeLog> listInformLog;

  /**
   * 流程类别0开始1普通2结束
   */
  String nodeType;

  /**
   * 下一步节点类别0开始1普通2结束
   */
  String nextNodeType;

  /**
   * 页面操作方式next下一步back上一步return返回发起人yesEnd正常结束noEnd不同意并结束
   */
  String webDo;

  String greateItemNode;

  String formAddress;

  /**
   * 选中的人
   */
  List<int> userIds;

  /**
   * 选中的岗位
   */
  List<int> positionIds;

  int regId;

  String slbh;

  String itemName;

  String proposerName;

  /**
   * 办理人所在部门社会信用代码
   */
  String orgCode;

  /**
   * 办件编号
   */
  String projectNo;

//  /**
//   * 办理使用时间
//   */
//   Object[] useTime;

  /****************以上为自己添加字段********************/

  RunNodeLog(
      this.id,
      this.recordCreateTime,
      this.nodename,
      this.doUserId,
      this.stime,
      this.etime,
      this.nodeContent,
      this.backLogId,
      this.dotype,
      this.logType,
      this.logid,
      this.signInformContent,
      this.endType,
      this.flowId,
      this.nodeId,
      this.runFlowId,
      this.doDateTime,
      this.rowGuid,
      this.cdSign,
      this.warningDateTime,
      this.acceptUserId,
      this.thisNodeId,
      this.thisRunNodeId,
      this.doUserName,
      this.officePhone,
      this.regName,
      this.depName,
      this.listSignLog,
      this.listInformLog,
      this.nodeType,
      this.nextNodeType,
      this.webDo,
      this.greateItemNode,
      this.formAddress,
      this.userIds,
      this.positionIds,
      this.regId,
      this.slbh,
      this.itemName,
      this.proposerName,
      this.orgCode,
      this.projectNo);

  factory RunNodeLog.fromJson(Map<String, dynamic> srcJson) =>
      _$RunNodeLogFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RunNodeLogToJson(this);
}
