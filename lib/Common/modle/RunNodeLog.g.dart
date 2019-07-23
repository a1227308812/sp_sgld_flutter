// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RunNodeLog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunNodeLog _$RunNodeLogFromJson(Map<String, dynamic> json) {
  return RunNodeLog(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['nodename'] as String,
      json['doUserId'] as int,
      json['stime'] as String,
      json['etime'] as String,
      json['nodeContent'] as String,
      json['backLogId'] as int,
      json['dotype'] as String,
      json['logType'] as String,
      json['logid'] as int,
      json['signInformContent'] as String,
      json['endType'] as String,
      json['flowId'] as int,
      json['nodeId'] as int,
      json['runFlowId'] as int,
      json['doDateTime'] as String,
      json['rowGuid'] as String,
      json['cdSign'] as String,
      json['warningDateTime'] as String,
      json['acceptUserId'] as int,
      json['thisNodeId'] as int,
      json['thisRunNodeId'] as int,
      json['doUserName'] as String,
      json['officePhone'] as String,
      json['regName'] as String,
      json['depName'] as String,
      (json['listSignLog'] as List)
          ?.map((e) =>
              e == null ? null : RunNodeLog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listInformLog'] as List)
          ?.map((e) =>
              e == null ? null : RunNodeLog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['nodeType'] as String,
      json['nextNodeType'] as String,
      json['webDo'] as String,
      json['greateItemNode'] as String,
      json['formAddress'] as String,
      (json['userIds'] as List)?.map((e) => e as int)?.toList(),
      (json['positionIds'] as List)?.map((e) => e as int)?.toList(),
      json['regId'] as int,
      json['slbh'] as String,
      json['itemName'] as String,
      json['proposerName'] as String,
      json['orgCode'] as String,
      json['projectNo'] as String);
}

Map<String, dynamic> _$RunNodeLogToJson(RunNodeLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'nodename': instance.nodename,
      'doUserId': instance.doUserId,
      'stime': instance.stime,
      'etime': instance.etime,
      'nodeContent': instance.nodeContent,
      'backLogId': instance.backLogId,
      'dotype': instance.dotype,
      'logType': instance.logType,
      'logid': instance.logid,
      'signInformContent': instance.signInformContent,
      'endType': instance.endType,
      'flowId': instance.flowId,
      'nodeId': instance.nodeId,
      'runFlowId': instance.runFlowId,
      'doDateTime': instance.doDateTime,
      'rowGuid': instance.rowGuid,
      'cdSign': instance.cdSign,
      'warningDateTime': instance.warningDateTime,
      'acceptUserId': instance.acceptUserId,
      'thisNodeId': instance.thisNodeId,
      'thisRunNodeId': instance.thisRunNodeId,
      'doUserName': instance.doUserName,
      'officePhone': instance.officePhone,
      'regName': instance.regName,
      'depName': instance.depName,
      'listSignLog': instance.listSignLog,
      'listInformLog': instance.listInformLog,
      'nodeType': instance.nodeType,
      'nextNodeType': instance.nextNodeType,
      'webDo': instance.webDo,
      'greateItemNode': instance.greateItemNode,
      'formAddress': instance.formAddress,
      'userIds': instance.userIds,
      'positionIds': instance.positionIds,
      'regId': instance.regId,
      'slbh': instance.slbh,
      'itemName': instance.itemName,
      'proposerName': instance.proposerName,
      'orgCode': instance.orgCode,
      'projectNo': instance.projectNo
    };
