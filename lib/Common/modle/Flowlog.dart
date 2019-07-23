import 'package:json_annotation/json_annotation.dart';

part 'Flowlog.g.dart';

@JsonSerializable()
class Flowlog{
  /**
   * id主键
   */
   int id;

  /**
   * 记录创建时间
   */
   String recordCreateTime;

  /**
   * 办件信息表Id
   */
  
   int businessId;

  /**
   * 业务Id
   */
  
   int otherId;

  /**
   * 审核人
   */
  
   int verifyUserId;

  /**
   * 审核人姓名
   */
  
   String verifyUserName;

  /**
   * 审核时间
   */
  
   String verifyTime;

  /**
   * 审核意见
   */
  
   String content;

  /**
   * 审核状态0审核中1通过2不通过3取消
   */
  
   String verifyState;

  /**
   * 流程类别0暂停1报延
   */
  
   String flowType;

  /****************以上主要为系统表字段********************/

   String verifyStateName;

  /****************以上为自己添加字段********************/

   Flowlog(this.id, this.recordCreateTime, this.businessId, this.otherId,
       this.verifyUserId, this.verifyUserName, this.verifyTime, this.content,
       this.verifyState, this.flowType, this.verifyStateName);

   factory Flowlog.fromJson(Map<String, dynamic> srcJson) =>
      _$FlowlogFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FlowlogToJson(this);
}