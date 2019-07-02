// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListRole.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRole _$ListRoleFromJson(Map<String, dynamic> json) {
  return ListRole(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['roleName'] as String,
      json['enabled'] as String,
      json['remark'] as String,
      json['roleType'] as String,
      json['systemType'] as String,
      json['orderNo'] as int,
      json['roleTypeName'] as String,
      json['systemTypeName'] as String,
      json['enabledName'] as String);
}

Map<String, dynamic> _$ListRoleToJson(ListRole instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'roleName': instance.roleName,
      'enabled': instance.enabled,
      'remark': instance.remark,
      'roleType': instance.roleType,
      'systemType': instance.systemType,
      'orderNo': instance.orderNo,
      'roleTypeName': instance.roleTypeName,
      'systemTypeName': instance.systemTypeName,
      'enabledName': instance.enabledName
    };
