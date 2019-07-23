import 'package:json_annotation/json_annotation.dart';

import 'Patrol.dart';

/**
 * Created by ZWP on 2019/7/23 14:08.
 * 描述：行业监管巡查人员
 */
part 'PatrolRummage.g.dart';

@JsonSerializable()
class PatrolRummage {
  /**
   * 主键id
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 行业监管Id
   */
  int patrolId;

  /**
   * 巡查人员姓名
   */
  String rummageName;

  /**
   * 巡查人员编号
   */
  String rummageNo;

  /**
   * 巡查人员电话
   */
  String rummageTel;

  /****************以上主要为系统表字段********************/

  /****************以上为自己添加字段********************/

  PatrolRummage(this.id, this.recordCreateTime, this.patrolId, this.rummageName,
      this.rummageNo, this.rummageTel);

  factory PatrolRummage.fromJson(Map<String, dynamic> srcJson) =>
      _$PatrolRummageFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PatrolRummageToJson(this);
}
