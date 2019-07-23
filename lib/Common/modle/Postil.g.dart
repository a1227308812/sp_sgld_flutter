// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Postil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Postil _$PostilFromJson(Map<String, dynamic> json) {
  return Postil(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['stuffId'] as int,
      json['businessId'] as int,
      json['content'] as String,
      json['userId'] as int,
      json['postilDateTime'] as String,
      json['userImgUuid'] as String,
      json['userName'] as String,
      json['stuffName'] as String);
}

Map<String, dynamic> _$PostilToJson(Postil instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'stuffId': instance.stuffId,
      'businessId': instance.businessId,
      'content': instance.content,
      'userId': instance.userId,
      'postilDateTime': instance.postilDateTime,
      'userImgUuid': instance.userImgUuid,
      'userName': instance.userName,
      'stuffName': instance.stuffName
    };
