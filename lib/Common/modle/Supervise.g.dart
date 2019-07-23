// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Supervise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Supervise _$SuperviseFromJson(Map<String, dynamic> json) {
  return Supervise(
      json['id'] as int,
      json['businessId'] as int,
      json['superviseTime'] as String,
      json['content'] as String,
      json['sendUserId'] as int,
      json['acceptUserId'] as int,
      json['answer'] as String,
      json['logId'] as int,
      json['SLBH'] as String,
      json['itemName'] as String,
      json['acceptUserName'] as String,
      json['sendUserName'] as String,
      json['acceptDate'] as String,
      json['consentDate'] as String,
      json['acceptRegName'] as String,
      json['acceptDepName'] as String,
      json['sendRegName'] as String,
      json['sendDepName'] as String,
      json['sdate'] as String,
      json['edate'] as String,
      json['nodeName'] as String);
}

Map<String, dynamic> _$SuperviseToJson(Supervise instance) => <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'superviseTime': instance.superviseTime,
      'content': instance.content,
      'sendUserId': instance.sendUserId,
      'acceptUserId': instance.acceptUserId,
      'answer': instance.answer,
      'logId': instance.logId,
      'SLBH': instance.SLBH,
      'itemName': instance.itemName,
      'acceptUserName': instance.acceptUserName,
      'sendUserName': instance.sendUserName,
      'acceptDate': instance.acceptDate,
      'consentDate': instance.consentDate,
      'acceptRegName': instance.acceptRegName,
      'acceptDepName': instance.acceptDepName,
      'sendRegName': instance.sendRegName,
      'sendDepName': instance.sendDepName,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'nodeName': instance.nodeName
    };
