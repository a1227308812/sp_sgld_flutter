// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MenuInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuInfo _$MenuInfoFromJson(Map<String, dynamic> json) {
  return MenuInfo(
      json['id'] as int,
      json['parentId'] as int,
      json['maintainable'] as String,
      json['type'] as String,
      json['code'] as String,
      json['zvalue'] as String,
      json['zdescribe'] as String,
      json['level'] as int);
}

Map<String, dynamic> _$MenuInfoToJson(MenuInfo instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'maintainable': instance.maintainable,
      'type': instance.type,
      'code': instance.code,
      'zvalue': instance.zvalue,
      'zdescribe': instance.zdescribe,
      'level': instance.level
    };
