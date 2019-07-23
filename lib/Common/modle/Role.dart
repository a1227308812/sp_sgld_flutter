import 'package:json_annotation/json_annotation.dart';

part 'Role.g.dart';

@JsonSerializable()
class Role {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 角色名称
   */

  String roleName;

  /**
   * 启用状态 参见数据字典enabled
   */

  String enabled;

  /**
   * 备注说明
   */

  String remark;

  /**
   * 角色类别 参见数据字典 roleType
   */

  String roleType;

  /**
   * 角色系统类别 参见数据字典 systemType
   */

  String systemType;

  /**
   * 排序
   */

  int orderNo;

  /****************以上主要为系统表字段********************/

  /**
   * 角色类别
   */
  String roleTypeName;

  /**
   * 角色系统类别
   */
  String systemTypeName;

  /**
   * 是否启用
   */
  String enabledName;

  /****************以上为自己添加字段********************/


  Role(this.id, this.recordCreateTime, this.roleName, this.enabled, this.remark,
      this.roleType, this.systemType, this.orderNo, this.roleTypeName,
      this.systemTypeName, this.enabledName);

  factory Role.fromJson(Map<String, dynamic> srcJson) =>
      _$RoleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
