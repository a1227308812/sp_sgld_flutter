import 'package:json_annotation/json_annotation.dart';
import 'package:sp_sgld_flutter/Common/modle/SuperBuspush.dart';

import 'Business.dart';

part 'Patrol.g.dart';
/**
 * Created by ZWP on 2019/7/23 14:09.
 * 描述：行业监管库
 */
@JsonSerializable()
class Patrol {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 被监管的企业或个人名
   */

  String patroldName;

  /**
   * 工商注册号(信用代码)或身份证号
   */

  String no;

  /**
   * 地址
   */

  String address;

  /**
   * 法人
   */

  String companyLegalPersonName;

  /**
   * 企业联系人
   */

  String companyContacts;

  /**
   * 联系方式
   */

  String contactInformation;

  /**
   * 检查日期
   */

  String patrolDate;

  /**
   * 检查结果
   */

  String patrolResult;

  /**
   * 处理结果
   */

  String treatmentResult;

  /**
   * 整改到期时间
   */

  String treatmentEndDate;

  /**
   * 检查结果说明
   */

  String patrolResultExplain;

  /**
   * 巡查人员姓名
   */

  String rummageName;

  /**
   * 是否外网显示
   */

  String isWebShow;

  /**
   * 被检查次数
   */

  String patrolNum;

  /**
   * 监管人Id
   */

  int userId;

  /**
   * 办件ID
   */

  int businessId;

  /**
   * 申请人/企业名称
   */

  String proposerName;

  /**
   * 监管部门ID
   */

  int depId;

  /**
   * 监管推送的ID
   */

  int superBusId;

  /**
   * 执法认领状态  0未认领  1认领
   */

  int zfClaimState;

  /**
   * 认领人ID
   */

  int claimUser;

  /**
   * 认领时间
   */

  String claimTime;

  /**
   * 企业或个人
   */

  String personOrCompany;

  /****************以上主要为系统表字段********************/
    //办件信息
   Business business;
//
//  /**
//   * 检查结果记录表
//   */
//   List<Upfiles> listNoteTableFile ;
//
//  /**
//   * 其他附件
//   */
//   List<Upfiles> listOtherFile;
//
//  /**
//   * 整改记录
//   */
//   List<Reform> listReform;
//
//  /**
//   * 巡查人员信息
//   */
//   List<PatrolRummage> listRummages;

  /**
   * 监管部门名称
   */
  String depName;

  /**
   * 监管人名称
   */
  String userName;

  /**
   * 查询条件（开始日期）
   */
  String sdate;

  /**
   * 查询条件（结束日期）
   */
  String edate;

  /**
   * 认领人
   */
  int zfUserId;

  /**
   * 事项名称
   */
  String itemName;

  /**
   * 认领人姓名
   */
  String claimUserName;

  /**
   * 服务对象
   */
  String serviceObject;

  /**
   * 执法结果
   */
  String penaltyResult;

  /**
   * 执法信息id
   */
  int apparitorId;

  Patrol(
      this.id,
      this.recordCreateTime,
      this.patroldName,
      this.no,
      this.address,
      this.companyLegalPersonName,
      this.companyContacts,
      this.contactInformation,
      this.patrolDate,
      this.patrolResult,
      this.treatmentResult,
      this.treatmentEndDate,
      this.patrolResultExplain,
      this.rummageName,
      this.isWebShow,
      this.patrolNum,
      this.userId,
      this.businessId,
      this.proposerName,
      this.depId,
      this.superBusId,
      this.zfClaimState,
      this.claimUser,
      this.claimTime,
      this.personOrCompany,
      this.depName,
      this.userName,
      this.sdate,
      this.edate,
      this.zfUserId,
      this.itemName,
      this.claimUserName,
      this.serviceObject,
      this.penaltyResult,
      this.business,
      this.apparitorId);

   SuperBuspush superBuspush;
//
//   List<RunNodeLog> listRunNodeLog;

  factory Patrol.fromJson(Map<String, dynamic> srcJson) =>
      _$PatrolFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PatrolToJson(this);
}
