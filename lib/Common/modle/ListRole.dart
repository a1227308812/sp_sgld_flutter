import 'package:json_annotation/json_annotation.dart';

part 'ListRole.g.dart';

@JsonSerializable()
class ListRole extends Object {
  int id;

  String recordCreateTime;

  String roleName;

  String enabled;

  String remark;

  String roleType;

  String systemType;

  int orderNo;

  String roleTypeName;

  String systemTypeName;

  String enabledName;

  ListRole(
      this.id,
      this.recordCreateTime,
      this.roleName,
      this.enabled,
      this.remark,
      this.roleType,
      this.systemType,
      this.orderNo,
      this.roleTypeName,
      this.systemTypeName,
      this.enabledName);

  factory ListRole.fromJson(Map<String, dynamic> srcJson) =>
      _$ListRoleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ListRoleToJson(this);
}
