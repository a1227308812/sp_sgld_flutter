
import 'package:json_annotation/json_annotation.dart';

import 'Flowlog.dart';


part 'Delay.g.dart';

@JsonSerializable()
class Delay{
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
   * 报延原因
   */
  
   String content;

  /**
   * 报延天数
   */
  
   String dayNum;

  /**
   * 申请时间
   */
  
   String acceptTime;

  /**
   * 审核通过时间
   */
  
   String doTime;

  /**
   * 申请人
   */
  
   int acceptUserId;

  /**
   * 申请人姓名
   */
  
   String acceptUserName;

  /**
   * 当前审核人
   */
  
   int verifyUserId;

  /**
   * 当前审核人姓名
   */
  
   String verifyUserName;

  /**
   * 审核状态0审核中1通过2不通过3取消
   */
  
   String verifyState;

  /**
   * 报延前的日期
   */
  
   String beforeConsentDate;

  /**
   * 报延后的日期
   */
  
   String afterConsentDate;

  /****************以上主要为系统表字段********************/

   List<Flowlog> listFlowlog ;

   String itemNameLike;

   String depId;

   String depName;

   String regId;

   String proposerNameLike;

   String itemCategory;

   String slbh;

  /****************以上为自己添加字段********************/


   Delay(this.id, this.recordCreateTime, this.businessId, this.content,
       this.dayNum, this.acceptTime, this.doTime, this.acceptUserId,
       this.acceptUserName, this.verifyUserId, this.verifyUserName,
       this.verifyState, this.beforeConsentDate, this.afterConsentDate,
       this.listFlowlog, this.itemNameLike, this.depId, this.depName,
       this.regId, this.proposerNameLike, this.itemCategory, this.slbh);

   factory Delay.fromJson(Map<String, dynamic> srcJson) =>
      _$DelayFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DelayToJson(this);
}