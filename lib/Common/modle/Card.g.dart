// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['sendTime'] as String,
      json['cardType'] as String,
      json['content'] as String,
      json['acceptUserId'] as int,
      json['acceptDepId'] as int,
      json['acceptRegId'] as int,
      json['acceptUserName'] as String,
      json['acceptDepName'] as String,
      json['acceptRegName'] as String,
      json['sendUserId'] as int,
      json['sendUserName'] as String,
      json['sendRegName'] as String,
      json['sendDepName'] as String,
      json['logId'] as int,
      json['nodeName'] as String,
      json['slbh'] as String,
      json['businessAcceptDateTime'] as String,
      json['businessConsentDate'] as String,
      json['businessAcceptUserName'] as String,
      json['businessAcceptUserDepName'] as String,
      json['businessAcceptUserRegName'] as String,
      json['itemName'] as String,
      json['sdate'] as String,
      json['edate'] as String,
      json['mobileSendUserName'] as String);
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'sendTime': instance.sendTime,
      'cardType': instance.cardType,
      'content': instance.content,
      'acceptUserId': instance.acceptUserId,
      'acceptDepId': instance.acceptDepId,
      'acceptRegId': instance.acceptRegId,
      'acceptUserName': instance.acceptUserName,
      'acceptDepName': instance.acceptDepName,
      'acceptRegName': instance.acceptRegName,
      'sendUserId': instance.sendUserId,
      'sendUserName': instance.sendUserName,
      'sendRegName': instance.sendRegName,
      'sendDepName': instance.sendDepName,
      'logId': instance.logId,
      'nodeName': instance.nodeName,
      'slbh': instance.slbh,
      'businessAcceptDateTime': instance.businessAcceptDateTime,
      'businessConsentDate': instance.businessConsentDate,
      'businessAcceptUserName': instance.businessAcceptUserName,
      'businessAcceptUserDepName': instance.businessAcceptUserDepName,
      'businessAcceptUserRegName': instance.businessAcceptUserRegName,
      'itemName': instance.itemName,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'mobileSendUserName': instance.mobileSendUserName
    };
