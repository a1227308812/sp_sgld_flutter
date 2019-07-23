// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PatrolRummage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatrolRummage _$PatrolRummageFromJson(Map<String, dynamic> json) {
  return PatrolRummage(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['patrolId'] as int,
      json['rummageName'] as String,
      json['rummageNo'] as String,
      json['rummageTel'] as String);
}

Map<String, dynamic> _$PatrolRummageToJson(PatrolRummage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'patrolId': instance.patrolId,
      'rummageName': instance.rummageName,
      'rummageNo': instance.rummageNo,
      'rummageTel': instance.rummageTel
    };
