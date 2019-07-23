import 'package:json_annotation/json_annotation.dart';

part 'Position.g.dart';

@JsonSerializable()
class Position {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 区划ID
   */

  int regId;

  /**
   * 部门ID
   */

  int depId;

  /**
   * 岗位名称
   */

  String positionName;

  /**
   * 岗位描述
   */

  String positionRemark;

  /****************以上主要为系统表字段********************/

  int bottomRegId;

  List regIds;

  String regName;

  String depName;

  String allName;

  /**
   * 修改环节的时候，按照岗位设置，这个字段是用于判断当前岗位是否是当前环节已经选中的
   */
  String isChecked;

  /****************以上为自己添加字段********************/


  Position(this.id, this.recordCreateTime, this.regId, this.depId,
      this.positionName, this.positionRemark, this.bottomRegId, this.regIds,
      this.regName, this.depName, this.allName, this.isChecked);

  factory Position.fromJson(Map<String, dynamic> srcJson) =>
      _$PositionFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
