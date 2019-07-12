// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemClaim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemClaim _$ItemClaimFromJson(Map<String, dynamic> json) {
  return ItemClaim(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['depId'] as int,
      json['userId'] as int,
      json['pushContent'] as String,
      json['claimState'] as int,
      json['itemNo'] as String,
      json['itemName'] as String,
      json['depName'] as String,
      json['userName'] as String,
      json['proposerName'] as String);
}

Map<String, dynamic> _$ItemClaimToJson(ItemClaim instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'depId': instance.depId,
      'userId': instance.userId,
      'pushContent': instance.pushContent,
      'claimState': instance.claimState,
      'itemNo': instance.itemNo,
      'itemName': instance.itemName,
      'depName': instance.depName,
      'userName': instance.userName,
      'proposerName': instance.proposerName
    };
