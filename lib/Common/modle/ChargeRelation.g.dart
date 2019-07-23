// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChargeRelation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeRelation _$ChargeRelationFromJson(Map<String, dynamic> json) {
  return ChargeRelation(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['itemChargeId'] as int,
      json['businessId'] as int,
      json['price'] as String,
      json['num'] as String,
      json['shouldMoney'] as String,
      json['derateMoney'] as String,
      json['chargeMoney'] as String,
      json['sendbackMoney'] as String,
      json['factMoney'] as String,
      json['acceptUserid'] as int,
      json['acceptTime'] as String,
      json['doUserid'] as int,
      json['doTime'] as String,
      json['chargeNo'] as String,
      json['chargeName'] as String,
      json['chargeUpper'] as String,
      json['chargeLower'] as String,
      json['isDesc'] as String,
      (json['listChargeRe'] as List)
          ?.map((e) => e == null
              ? null
              : ChargeRelation.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChargeRelationToJson(ChargeRelation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'itemChargeId': instance.itemChargeId,
      'businessId': instance.businessId,
      'price': instance.price,
      'num': instance.num,
      'shouldMoney': instance.shouldMoney,
      'derateMoney': instance.derateMoney,
      'chargeMoney': instance.chargeMoney,
      'sendbackMoney': instance.sendbackMoney,
      'factMoney': instance.factMoney,
      'acceptUserid': instance.acceptUserid,
      'acceptTime': instance.acceptTime,
      'doUserid': instance.doUserid,
      'doTime': instance.doTime,
      'chargeNo': instance.chargeNo,
      'chargeName': instance.chargeName,
      'chargeUpper': instance.chargeUpper,
      'chargeLower': instance.chargeLower,
      'isDesc': instance.isDesc,
      'listChargeRe': instance.listChargeRe
    };
