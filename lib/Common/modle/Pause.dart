import 'package:json_annotation/json_annotation.dart';

import 'Flowlog.dart';

part 'Pause.g.dart';

@JsonSerializable()
class Pause {
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
   * 暂停类别
   */

  String pauseType;

  /**
   * 暂停原因
   */

  String content;

  /**
   * 结束暂停情况说明
   */

  String endcontent;

  /**
   * 暂停开始日期
   */

  String sdate;

  /**
   * 暂停结束日期
   */

  String edate;

  /**
   * 暂停开始时间
   */

  String stime;

  /**
   * 暂停结束时间
   */

  String etime;

  /**
   * 申请时间
   */

  String acceptTime;

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
   * 暂停状态0未开始暂停1暂停中2已结束暂停并启动办件
   */

  String state;

  /****************以上主要为系统表字段********************/

  List<Flowlog> listFlowlog ;

  String pauseTypeName;

  String itemNameLike;

  String depId;

  String depName;

  String regId;

  String proposerNameLike;

  String itemCategory;

  String slbh;

  /****************以上为自己添加字段********************/


  Pause(this.id, this.recordCreateTime, this.businessId, this.pauseType,
      this.content, this.endcontent, this.sdate, this.edate, this.stime,
      this.etime, this.acceptTime, this.acceptUserId, this.acceptUserName,
      this.verifyUserId, this.verifyUserName, this.verifyState, this.state,
      this.listFlowlog, this.pauseTypeName, this.itemNameLike, this.depId,
      this.depName, this.regId, this.proposerNameLike, this.itemCategory,
      this.slbh);

  factory Pause.fromJson(Map<String, dynamic> srcJson) =>
      _$PauseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PauseToJson(this);
}
