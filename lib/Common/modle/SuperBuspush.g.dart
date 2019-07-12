// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuperBuspush.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperBuspush _$SuperBuspushFromJson(Map<String, dynamic> json) {
  return SuperBuspush(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['depId'] as int,
      json['userId'] as int,
      json['pushContent'] as String,
      json['claimState'] as int,
      json['claimUser'] as int,
      json['claimTime'] as String,
      json['itemNo'] as String,
      json['ip'] as String,
      json['itemName'] as String,
      json['depName'] as String,
      json['userName'] as String,
      json['claimUserName'] as String,
      json['proposerName'] as String,
      json['sdate'] as String,
      json['edate'] as String,
      json['itemCategory'] as String,
      json['itemType'] as String,
      json['flag'] as String,
      json['treatmentResult'] as String,
      json['patrolResult'] as String,
      json['patrolId'] as int,
      json['no'] as String,
      json['acceptLimit'] as int);
}

Map<String, dynamic> _$SuperBuspushToJson(SuperBuspush instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'depId': instance.depId,
      'userId': instance.userId,
      'pushContent': instance.pushContent,
      'claimState': instance.claimState,
      'claimUser': instance.claimUser,
      'claimTime': instance.claimTime,
      'itemNo': instance.itemNo,
      'ip': instance.ip,
      'itemName': instance.itemName,
      'depName': instance.depName,
      'userName': instance.userName,
      'claimUserName': instance.claimUserName,
      'proposerName': instance.proposerName,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'itemCategory': instance.itemCategory,
      'itemType': instance.itemType,
      'flag': instance.flag,
      'treatmentResult': instance.treatmentResult,
      'patrolResult': instance.patrolResult,
      'patrolId': instance.patrolId,
      'no': instance.no,
      'acceptLimit': instance.acceptLimit
    };
