// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Reform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reform _$ReformFromJson(Map<String, dynamic> json) {
  return Reform(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['patrolId'] as String,
      json['personOrCompany'] as String,
      json['reformNum'] as String,
      json['reformResult'] as String,
      json['reformEndDate'] as String,
      json['reformResultExplain'] as String,
      json['patrolUserId'] as int,
      json['patrol'] == null
          ? null
          : Patrol.fromJson(json['patrol'] as Map<String, dynamic>),
      (json['reformNoteTableFile'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['reformOtherFile'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['proposerName'] as String,
      json['patrolUserName'] as String);
}

Map<String, dynamic> _$ReformToJson(Reform instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'patrolId': instance.patrolId,
      'personOrCompany': instance.personOrCompany,
      'reformNum': instance.reformNum,
      'reformResult': instance.reformResult,
      'reformEndDate': instance.reformEndDate,
      'reformResultExplain': instance.reformResultExplain,
      'patrolUserId': instance.patrolUserId,
      'patrol': instance.patrol,
      'reformNoteTableFile': instance.reformNoteTableFile,
      'reformOtherFile': instance.reformOtherFile,
      'proposerName': instance.proposerName,
      'patrolUserName': instance.patrolUserName
    };
