// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Flowlog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flowlog _$FlowlogFromJson(Map<String, dynamic> json) {
  return Flowlog(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['otherId'] as int,
      json['verifyUserId'] as int,
      json['verifyUserName'] as String,
      json['verifyTime'] as String,
      json['content'] as String,
      json['verifyState'] as String,
      json['flowType'] as String,
      json['verifyStateName'] as String);
}

Map<String, dynamic> _$FlowlogToJson(Flowlog instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'otherId': instance.otherId,
      'verifyUserId': instance.verifyUserId,
      'verifyUserName': instance.verifyUserName,
      'verifyTime': instance.verifyTime,
      'content': instance.content,
      'verifyState': instance.verifyState,
      'flowType': instance.flowType,
      'verifyStateName': instance.verifyStateName
    };
