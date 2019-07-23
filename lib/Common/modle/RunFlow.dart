import 'package:json_annotation/json_annotation.dart';

import 'RunNodeLog.dart';

part 'RunFlow.g.dart';

@JsonSerializable()
class RunFlow {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 流程设置ID
   */

  int flowId;

  /**
   * 流程名称
   */

  String flowName;

  /**
   * 流程类别
   */

  String flowType;

  /**
   * 记录第一步流程日志ID，便于返回发起人
   */

  int firstLogId;

  /**
   * 流程状态 0处理中 yesEnd正常结束 noEnd不同意并结束
   */

  String endType;

  /**
   * 流程当前状态 0正常处理中 end流程结束
   */

  String doState;

  /**
   * 法定时限
   */

  int legalLimit;

  /**
   * 承诺时限
   */

  int consentLimit;

  /**
   * 预警时限
   */

  int warningLimit;

  /****************以上主要为系统表字段********************/

  /**
   * 流程日志
   */
  RunNodeLog runNodeLog;

  /****************以上为自己添加字段********************/


  RunFlow(this.id, this.recordCreateTime, this.flowId, this.flowName,
      this.flowType, this.firstLogId, this.endType, this.doState,
      this.legalLimit, this.consentLimit, this.warningLimit, this.runNodeLog);

  factory RunFlow.fromJson(Map<String, dynamic> srcJson) =>
      _$RunFlowFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RunFlowToJson(this);
}
