// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['regId'] as int,
      json['depId'] as int,
      json['positionName'] as String,
      json['positionRemark'] as String,
      json['bottomRegId'] as int,
      json['regIds'] as List,
      json['regName'] as String,
      json['depName'] as String,
      json['allName'] as String,
      json['isChecked'] as String);
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'regId': instance.regId,
      'depId': instance.depId,
      'positionName': instance.positionName,
      'positionRemark': instance.positionRemark,
      'bottomRegId': instance.bottomRegId,
      'regIds': instance.regIds,
      'regName': instance.regName,
      'depName': instance.depName,
      'allName': instance.allName,
      'isChecked': instance.isChecked
    };
