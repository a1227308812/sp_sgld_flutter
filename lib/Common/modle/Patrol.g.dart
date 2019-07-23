// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Patrol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patrol _$PatrolFromJson(Map<String, dynamic> json) {
  return Patrol(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['patroldName'] as String,
      json['no'] as String,
      json['address'] as String,
      json['companyLegalPersonName'] as String,
      json['companyContacts'] as String,
      json['contactInformation'] as String,
      json['patrolDate'] as String,
      json['patrolResult'] as String,
      json['treatmentResult'] as String,
      json['treatmentEndDate'] as String,
      json['patrolResultExplain'] as String,
      json['rummageName'] as String,
      json['isWebShow'] as String,
      json['patrolNum'] as String,
      json['userId'] as int,
      json['businessId'] as int,
      json['proposerName'] as String,
      json['depId'] as int,
      json['superBusId'] as int,
      json['zfClaimState'] as int,
      json['claimUser'] as int,
      json['claimTime'] as String,
      json['personOrCompany'] as String,
      json['depName'] as String,
      json['userName'] as String,
      json['sdate'] as String,
      json['edate'] as String,
      json['zfUserId'] as int,
      json['itemName'] as String,
      json['claimUserName'] as String,
      json['serviceObject'] as String,
      json['penaltyResult'] as String,
      json['apparitorId'] as int)
    ..superBuspush = json['superBuspush'] == null
        ? null
        : SuperBuspush.fromJson(json['superBuspush'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PatrolToJson(Patrol instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'patroldName': instance.patroldName,
      'no': instance.no,
      'address': instance.address,
      'companyLegalPersonName': instance.companyLegalPersonName,
      'companyContacts': instance.companyContacts,
      'contactInformation': instance.contactInformation,
      'patrolDate': instance.patrolDate,
      'patrolResult': instance.patrolResult,
      'treatmentResult': instance.treatmentResult,
      'treatmentEndDate': instance.treatmentEndDate,
      'patrolResultExplain': instance.patrolResultExplain,
      'rummageName': instance.rummageName,
      'isWebShow': instance.isWebShow,
      'patrolNum': instance.patrolNum,
      'userId': instance.userId,
      'businessId': instance.businessId,
      'proposerName': instance.proposerName,
      'depId': instance.depId,
      'superBusId': instance.superBusId,
      'zfClaimState': instance.zfClaimState,
      'claimUser': instance.claimUser,
      'claimTime': instance.claimTime,
      'personOrCompany': instance.personOrCompany,
      'depName': instance.depName,
      'userName': instance.userName,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'zfUserId': instance.zfUserId,
      'itemName': instance.itemName,
      'claimUserName': instance.claimUserName,
      'serviceObject': instance.serviceObject,
      'penaltyResult': instance.penaltyResult,
      'apparitorId': instance.apparitorId,
      'superBuspush': instance.superBuspush
    };
