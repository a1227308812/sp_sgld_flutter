// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pause.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pause _$PauseFromJson(Map<String, dynamic> json) {
  return Pause(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['pauseType'] as String,
      json['content'] as String,
      json['endcontent'] as String,
      json['sdate'] as String,
      json['edate'] as String,
      json['stime'] as String,
      json['etime'] as String,
      json['acceptTime'] as String,
      json['acceptUserId'] as int,
      json['acceptUserName'] as String,
      json['verifyUserId'] as int,
      json['verifyUserName'] as String,
      json['verifyState'] as String,
      json['state'] as String,
      (json['listFlowlog'] as List)
          ?.map((e) =>
              e == null ? null : Flowlog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['pauseTypeName'] as String,
      json['itemNameLike'] as String,
      json['depId'] as String,
      json['depName'] as String,
      json['regId'] as String,
      json['proposerNameLike'] as String,
      json['itemCategory'] as String,
      json['slbh'] as String);
}

Map<String, dynamic> _$PauseToJson(Pause instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'pauseType': instance.pauseType,
      'content': instance.content,
      'endcontent': instance.endcontent,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'stime': instance.stime,
      'etime': instance.etime,
      'acceptTime': instance.acceptTime,
      'acceptUserId': instance.acceptUserId,
      'acceptUserName': instance.acceptUserName,
      'verifyUserId': instance.verifyUserId,
      'verifyUserName': instance.verifyUserName,
      'verifyState': instance.verifyState,
      'state': instance.state,
      'listFlowlog': instance.listFlowlog,
      'pauseTypeName': instance.pauseTypeName,
      'itemNameLike': instance.itemNameLike,
      'depId': instance.depId,
      'depName': instance.depName,
      'regId': instance.regId,
      'proposerNameLike': instance.proposerNameLike,
      'itemCategory': instance.itemCategory,
      'slbh': instance.slbh
    };
