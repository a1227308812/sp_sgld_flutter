// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Oncetell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oncetell _$OncetellFromJson(Map<String, dynamic> json) {
  return Oncetell(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['stime'] as String,
      json['overtime'] as String,
      json['etime'] as String,
      json['content'] as String,
      json['state'] as String,
      json['douserId'] as int,
      json['doUserName'] as String);
}

Map<String, dynamic> _$OncetellToJson(Oncetell instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'stime': instance.stime,
      'overtime': instance.overtime,
      'etime': instance.etime,
      'content': instance.content,
      'state': instance.state,
      'douserId': instance.douserId,
      'doUserName': instance.doUserName
    };
