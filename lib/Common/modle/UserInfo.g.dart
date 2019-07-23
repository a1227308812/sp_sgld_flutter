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
      json['job'] as String,
      json['loginName'] as String,
      json['enabled'] as String,
      json['allSpelling'] as String,
      json['firstSpelling'] as String,
      json['mobilePhone'] as String,
      json['officePhone'] as String,
      json['regId'] as int,
      json['depId'] as int,
      json['userSpeRoute'] as String,
      json['checkNum'] as String,
      json['callWindowId'] as int,
      json['jobNo'] as String,
      json['upfilesId'] as int,
      json['upWorkerCode'] as String,
      json['cardNo'] as String,
      json['email'] as String,
      json['isWorkUser'] as String,
      json['cloudDiskSize'] as int,
      (json['cloudDiskUsedSize'] as num)?.toDouble(),
      json['emsUserNameCenter'] as String,
      json['emsUserTelCenter'] as String,
      json['emsAddressCenter'] as String,
      json['post'] as String,
      json['creditTokenId'] as String,
      json['investmentTokenId'] as String,
      json['pause'] as int,
      json['callWindowNo'] as String,
      json['areaName'] as String,
      json['callWindowName'] as String,
      json['callOtherName'] as String,
      json['newLoginName'] as String,
      json['enabledName'] as String,
      (json['listRole'] as List)
          ?.map((e) =>
              e == null ? null : Role.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['roleids'] as String,
      (json['listPosition'] as List)
          ?.map((e) =>
              e == null ? null : Position.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['ifOnline'] as String,
      json['password2'] as String,
      json['ifNeedChangePWD'] as bool,
      json['oldPassword'] as String,
      json['depName'] as String,
      json['depType'] as String,
      json['depTypes'] as String,
      json['regName'] as String,
      json['depPathName'] as String,
      json['nodeId'] as int,
      json['businessType'] as String,
      json['upfilesName'] as String,
      json['upfilesPath'] as String,
      json['upfilesUuid'] as String,
      json['isCallWindowUser'] as String,
      json['bjNum'] as String,
      json['tqNum'] as String,
      json['tqPercent'] as String,
      json['nowMonthNum'] as String,
      json['avgThreeMonthNum'] as String,
      (json['addPercent'] as num)?.toDouble(),
      json['lateNum'] as String,
      json['earlyNum'] as String,
      json['authKey'] as String,
      json['sid'] as String,
      json['isSpecil'] as String)
    ..userIds = (json['userIds'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'password': instance.password,
      'userName': instance.userName,
      'job': instance.job,
      'loginName': instance.loginName,
      'enabled': instance.enabled,
      'allSpelling': instance.allSpelling,
      'firstSpelling': instance.firstSpelling,
      'mobilePhone': instance.mobilePhone,
      'officePhone': instance.officePhone,
      'regId': instance.regId,
      'depId': instance.depId,
      'userSpeRoute': instance.userSpeRoute,
      'checkNum': instance.checkNum,
      'callWindowId': instance.callWindowId,
      'jobNo': instance.jobNo,
      'upfilesId': instance.upfilesId,
      'upWorkerCode': instance.upWorkerCode,
      'cardNo': instance.cardNo,
      'email': instance.email,
      'isWorkUser': instance.isWorkUser,
      'cloudDiskSize': instance.cloudDiskSize,
      'cloudDiskUsedSize': instance.cloudDiskUsedSize,
      'emsUserNameCenter': instance.emsUserNameCenter,
      'emsUserTelCenter': instance.emsUserTelCenter,
      'emsAddressCenter': instance.emsAddressCenter,
      'post': instance.post,
      'creditTokenId': instance.creditTokenId,
      'investmentTokenId': instance.investmentTokenId,
      'pause': instance.pause,
      'callWindowNo': instance.callWindowNo,
      'areaName': instance.areaName,
      'callWindowName': instance.callWindowName,
      'callOtherName': instance.callOtherName,
      'newLoginName': instance.newLoginName,
      'enabledName': instance.enabledName,
      'listRole': instance.listRole,
      'roleids': instance.roleids,
      'listPosition': instance.listPosition,
      'ifOnline': instance.ifOnline,
      'userIds': instance.userIds,
      'password2': instance.password2,
      'ifNeedChangePWD': instance.ifNeedChangePWD,
      'oldPassword': instance.oldPassword,
      'depName': instance.depName,
      'depType': instance.depType,
      'depTypes': instance.depTypes,
      'regName': instance.regName,
      'depPathName': instance.depPathName,
      'nodeId': instance.nodeId,
      'businessType': instance.businessType,
      'upfilesName': instance.upfilesName,
      'upfilesPath': instance.upfilesPath,
      'upfilesUuid': instance.upfilesUuid,
      'isCallWindowUser': instance.isCallWindowUser,
      'bjNum': instance.bjNum,
      'tqNum': instance.tqNum,
      'tqPercent': instance.tqPercent,
      'nowMonthNum': instance.nowMonthNum,
      'avgThreeMonthNum': instance.avgThreeMonthNum,
      'addPercent': instance.addPercent,
      'lateNum': instance.lateNum,
      'earlyNum': instance.earlyNum,
      'authKey': instance.authKey,
      'sid': instance.sid,
      'isSpecil': instance.isSpecil
    };
