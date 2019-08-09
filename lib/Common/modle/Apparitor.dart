import 'package:json_annotation/json_annotation.dart';
import 'package:sp_sgld_flutter/Common/modle/SuperBuspush.dart';

import 'Business.dart';
import 'Upfiles.dart';

part 'Apparitor.g.dart';

/**
 * Created by ZWP on 2019/7/30 9:43.
 * 描述：
 */
@JsonSerializable()
class Apparitor {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 监管推送的ID
   */

  int patrolId;

  /**
   * 执法日期
   */

  String apparitorDate;

  /**
   * 执法结果
   * 字典表:penaltyResult
   * <DataDic code="0" zvalue="警告"/>
      <DataDic code="1" zvalue="罚款"/>
      <DataDic code="2" zvalue="行政拘留"/>
      <DataDic code="3" zvalue="吊销"/>
      <DataDic code="4" zvalue="收缴和追缴"/>
      <DataDic code="5" zvalue="其它"/>
   */
  String penaltyResult;

  /**
   * 执法结果说明
   */

  String apparitorResultExplain;

  /**
   * 执法人员姓名
   */

  String apparitorName;

  /**
   * 执法部门ID
   */

  int depId;

  /**
   * 执法人Id
   */

  int userId;

  /****************以上主要为系统表字段********************/

  /**
   * 查询条件（开始日期）
   */
  String sdate;

  /**
   * 查询条件（结束日期）
   */
  String edate;

  /**
   * 申请人
   */
  String proposerName;

  /**
   * 执法结果记录表
   */
  List<Upfiles> listNoteTableFile;

  /**
   * 其他附件
   */
  List<Upfiles> listOtherFile;

  /**
   * 部门名称
   */
  String depName;

  /**
   * 执法人名称
   */
  String userName;

  /**
   * 身份证或企业信用编号
   */
  String no;

  /**
   * 服务对象
   */
  String serviceObject;

  Business business;

  String zfClaimState;

  /****************以上为自己添加字段********************/


  Apparitor(this.id, this.recordCreateTime, this.patrolId, this.apparitorDate,
      this.penaltyResult, this.apparitorResultExplain, this.apparitorName,
      this.depId, this.userId, this.sdate, this.edate, this.proposerName,
      this.listNoteTableFile, this.listOtherFile, this.depName, this.userName,
      this.no, this.serviceObject, this.business, this.zfClaimState);

  factory Apparitor.fromJson(Map<String, dynamic> srcJson) =>
      _$ApparitorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ApparitorToJson(this);
}
