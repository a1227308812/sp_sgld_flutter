// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RunFlow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunFlow _$RunFlowFromJson(Map<String, dynamic> json) {
  return RunFlow(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['flowId'] as int,
      json['flowName'] as String,
      json['flowType'] as String,
      json['firstLogId'] as int,
      json['endType'] as String,
      json['doState'] as String,
      json['legalLimit'] as int,
      json['consentLimit'] as int,
      json['warningLimit'] as int,
      json['runNodeLog'] == null
          ? null
          : RunNodeLog.fromJson(json['runNodeLog'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RunFlowToJson(RunFlow instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'flowId': instance.flowId,
      'flowName': instance.flowName,
      'flowType': instance.flowType,
      'firstLogId': instance.firstLogId,
      'endType': instance.endType,
      'doState': instance.doState,
      'legalLimit': instance.legalLimit,
      'consentLimit': instance.consentLimit,
      'warningLimit': instance.warningLimit,
      'runNodeLog': instance.runNodeLog
    };
