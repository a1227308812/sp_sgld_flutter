// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Apparitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apparitor _$ApparitorFromJson(Map<String, dynamic> json) {
  return Apparitor(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['patrolId'] as int,
      json['apparitorDate'] as String,
      json['penaltyResult'] as String,
      json['apparitorResultExplain'] as String,
      json['apparitorName'] as String,
      json['depId'] as int,
      json['userId'] as int,
      json['sdate'] as String,
      json['edate'] as String,
      json['proposerName'] as String,
      (json['listNoteTableFile'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listOtherFile'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['depName'] as String,
      json['userName'] as String,
      json['no'] as String,
      json['serviceObject'] as String,
      json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
      json['zfClaimState'] as String);
}

Map<String, dynamic> _$ApparitorToJson(Apparitor instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'patrolId': instance.patrolId,
      'apparitorDate': instance.apparitorDate,
      'penaltyResult': instance.penaltyResult,
      'apparitorResultExplain': instance.apparitorResultExplain,
      'apparitorName': instance.apparitorName,
      'depId': instance.depId,
      'userId': instance.userId,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'proposerName': instance.proposerName,
      'listNoteTableFile': instance.listNoteTableFile,
      'listOtherFile': instance.listOtherFile,
      'depName': instance.depName,
      'userName': instance.userName,
      'no': instance.no,
      'serviceObject': instance.serviceObject,
      'business': instance.business,
      'zfClaimState': instance.zfClaimState
    };
