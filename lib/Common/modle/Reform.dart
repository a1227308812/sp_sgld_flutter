import 'package:json_annotation/json_annotation.dart';

import 'Patrol.dart';
import 'Upfiles.dart';

part 'Reform.g.dart';

/**
 * Created by ZWP on 2019/7/23 14:09.
 * 描述：整改记录表
 */
@JsonSerializable()
class Reform {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 监管信息表id（关联检查信息）
   */

  String patrolId;

  /**
   * 企业或个人
   */

  String personOrCompany;

  /**
   * 整改次数
   */

  String reformNum;

  /**
   * 整改结果
   */

  String reformResult;

  /**
   * 整改到期时间
   */

  String reformEndDate;

  /**
   * 整改结果说明
   */

  String reformResultExplain;

  /**
   * 监管信息录入人ID
   */

  int patrolUserId;

  /****************以上主要为系统表字段********************/

  Patrol patrol;

  /**
   * 整改结果记录表
   */
  List<Upfiles> reformNoteTableFile;

  /**
   * 其他附件
   */
  List<Upfiles> reformOtherFile;

  /**
   * 申请人/企业名称
   */
  String proposerName;

  /**
   * 监管信息录入人姓名
   */
  String patrolUserName;

  /****************以上为自己添加字段********************/

  Reform(
      this.id,
      this.recordCreateTime,
      this.patrolId,
      this.personOrCompany,
      this.reformNum,
      this.reformResult,
      this.reformEndDate,
      this.reformResultExplain,
      this.patrolUserId,
      this.patrol,
      this.reformNoteTableFile,
      this.reformOtherFile,
      this.proposerName,
      this.patrolUserName);

  factory Reform.fromJson(Map<String, dynamic> srcJson) =>
      _$ReformFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReformToJson(this);
}
