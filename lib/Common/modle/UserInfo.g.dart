// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['password'] as String,
      json['userName'] as String,
      json['loginName'] as String,
      json['enabled'] as String,
      json['allSpelling'] as String,
      json['firstSpelling'] as String,
      json['regId'] as int,
      json['depId'] as int,
      json['jobNo'] as String,
      json['cloudDiskSize'] as int,
      json['cloudDiskUsedSize'] as double,
      json['enabledName'] as String,
      (json['listRole'] as List)
          ?.map((e) =>
              e == null ? null : ListRole.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['listPosition'] as List,
      json['ifOnline'] as String,
      json['ifNeedChangePWD'] as bool,
      json['depName'] as String,
      json['depType'] as String,
      json['regName'] as String,
      json['depPathName'] as String,
      json['addPercent'] as double,
      json['authKey'] as String,
      json['sid'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'password': instance.password,
      'userName': instance.userName,
      'loginName': instance.loginName,
      'enabled': instance.enabled,
      'allSpelling': instance.allSpelling,
      'firstSpelling': instance.firstSpelling,
      'regId': instance.regId,
      'depId': instance.depId,
      'jobNo': instance.jobNo,
      'cloudDiskSize': instance.cloudDiskSize,
      'cloudDiskUsedSize': instance.cloudDiskUsedSize,
      'enabledName': instance.enabledName,
      'listRole': instance.listRole,
      'listPosition': instance.listPosition,
      'ifOnline': instance.ifOnline,
      'ifNeedChangePWD': instance.ifNeedChangePWD,
      'depName': instance.depName,
      'depType': instance.depType,
      'regName': instance.regName,
      'depPathName': instance.depPathName,
      'addPercent': instance.addPercent,
      'authKey': instance.authKey,
      'sid': instance.sid
    };
