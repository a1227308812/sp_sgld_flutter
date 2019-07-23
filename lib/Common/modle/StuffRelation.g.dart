// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StuffRelation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StuffRelation _$StuffRelationFromJson(Map<String, dynamic> json) {
  return StuffRelation(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['stuffId'] as int,
      json['businessId'] as int,
      json['uniteRegisterId'] as int,
      json['fileIds'] as String,
      (json['listUpFiles'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['cardNo'] as String,
      json['companyNo'] as String,
      (json['listPostil'] as List)
          ?.map((e) =>
              e == null ? null : Postil.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['userId'] as int,
      json['pid'] as int,
      json['personStuffid'] as int,
      json['cid'] as int,
      json['companyStuffid'] as int);
}

Map<String, dynamic> _$StuffRelationToJson(StuffRelation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'stuffId': instance.stuffId,
      'businessId': instance.businessId,
      'uniteRegisterId': instance.uniteRegisterId,
      'fileIds': instance.fileIds,
      'listUpFiles': instance.listUpFiles,
      'cardNo': instance.cardNo,
      'companyNo': instance.companyNo,
      'listPostil': instance.listPostil,
      'userId': instance.userId,
      'pid': instance.pid,
      'personStuffid': instance.personStuffid,
      'cid': instance.cid,
      'companyStuffid': instance.companyStuffid
    };
