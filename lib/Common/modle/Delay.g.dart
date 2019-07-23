// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Delay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delay _$DelayFromJson(Map<String, dynamic> json) {
  return Delay(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['content'] as String,
      json['dayNum'] as String,
      json['acceptTime'] as String,
      json['doTime'] as String,
      json['acceptUserId'] as int,
      json['acceptUserName'] as String,
      json['verifyUserId'] as int,
      json['verifyUserName'] as String,
      json['verifyState'] as String,
      json['beforeConsentDate'] as String,
      json['afterConsentDate'] as String,
      (json['listFlowlog'] as List)
          ?.map((e) =>
              e == null ? null : Flowlog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['itemNameLike'] as String,
      json['depId'] as String,
      json['depName'] as String,
      json['regId'] as String,
      json['proposerNameLike'] as String,
      json['itemCategory'] as String,
      json['slbh'] as String);
}

Map<String, dynamic> _$DelayToJson(Delay instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'content': instance.content,
      'dayNum': instance.dayNum,
      'acceptTime': instance.acceptTime,
      'doTime': instance.doTime,
      'acceptUserId': instance.acceptUserId,
      'acceptUserName': instance.acceptUserName,
      'verifyUserId': instance.verifyUserId,
      'verifyUserName': instance.verifyUserName,
      'verifyState': instance.verifyState,
      'beforeConsentDate': instance.beforeConsentDate,
      'afterConsentDate': instance.afterConsentDate,
      'listFlowlog': instance.listFlowlog,
      'itemNameLike': instance.itemNameLike,
      'depId': instance.depId,
      'depName': instance.depName,
      'regId': instance.regId,
      'proposerNameLike': instance.proposerNameLike,
      'itemCategory': instance.itemCategory,
      'slbh': instance.slbh
    };
