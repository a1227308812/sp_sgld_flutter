// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Business _$BusinessFromJson(Map<String, dynamic> json) {
  return Business(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['regId'] as int,
      json['depId'] as int,
      json['itemId'] as int,
      json['itemNo'] as String,
      json['donum'] as String,
      json['slbh'] as String,
      json['acceptDate'] as String,
      json['acceptTime'] as String,
      json['doDate'] as String,
      json['doTime'] as String,
      json['saveTheDay'] as int,
      json['warningDate'] as String,
      json['consentDate'] as String,
      json['legalDate'] as String,
      json['itemdoState'] as String,
      json['bjbz'] as String,
      json['proposerId'] as int,
      json['acceptUserId'] as int,
      json['doUserId'] as int,
      json['ispick'] as String,
      json['runFlowId'] as int,
      json['chargeState'] as String,
      json['chargeMoney'] as String,
      json['itemCategory'] as String,
      json['itemType'] as String,
      json['oncetellState'] as String,
      json['shouldMoney'] as String,
      json['webApplyId'] as int,
      json['serviceObject'] as String,
      json['fetchTime'] as String,
      json['isReceive'] as String,
      json['receivTime'] as String,
      json['receiveUserId'] as int,
      json['receivIpInfo'] as String,
      json['isPush'] as String,
      json['pushDate'] as String,
      json['isPrint'] as String,
      json['uniteBusinessId'] as int,
      json['pickUp'] as int,
      json['pickUpUserName'] as String,
      json['pickUpAddress'] as String,
      json['pickUpPhone'] as String,
      json['expressNumber'] as String,
      json['expressType'] as int,
      json['rowGuid'] as String,
      json['projectNo'] as String,
      json['cdSignAccept'] as String,
      json['cdSignEnd'] as String,
      json['projectNoState'] as String,
      json['postalCode'] as String,
      json['appendixInfo'] as String,
      json['proposer'] == null
          ? null
          : Proposer.fromJson(json['proposer'] as Map<String, dynamic>),
      json['companyLib'] == null
          ? null
          : CompanyLib.fromJson(json['companyLib'] as Map<String, dynamic>),
      json['companyno'] as String,
      json['personLib'] == null
          ? null
          : PersonLib.fromJson(json['personLib'] as Map<String, dynamic>),
      json['proposerName'] as String,
      json['cardNo'] as String,
      json['linkUserName'] as String,
      json['phone'] as String,
      json['parentRegId'] as int,
      json['itemName'] as String,
      json['regName'] as String,
      json['depName'] as String,
      json['zfjgDepId'] as int,
      json['zfjgDepName'] as String,
      json['acceptUserName'] as String,
      json['receiveUserName'] as String,
      json['itemWarState'] as String,
      json['nodeWarState'] as String,
      json['doResultState'] as String,
      json['doResultSituation'] as String,
      (json['stuffIds'] as List)?.map((e) => e as int)?.toList(),
      (json['listStuff'] as List)
          ?.map((e) =>
              e == null ? null : ItemStuff.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listItemStuffNotUpload'] as List)
          ?.map((e) =>
              e == null ? null : ItemStuff.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['stuffRelationId'] as int,
      (json['listStuffRelation'] as List)
          ?.map((e) => e == null
              ? null
              : StuffRelation.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['stuffFileIds'] as int,
      (json['listLicence'] as List)
          ?.map((e) =>
              e == null ? null : Licence.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['qRCodeUrl'] as String,
      json['flowId'] as int,
      json['logId'] as int,
      json['nowNodeName'] as String,
      json['toItemId'] as int,
      json['toItemName'] as String,
      json['thisNodeType'] as String,
      json['item'] == null
          ? null
          : Item.fromJson(json['item'] as Map<String, dynamic>),
      json['runFlow'] == null
          ? null
          : RunFlow.fromJson(json['runFlow'] as Map<String, dynamic>),
      json['log'] == null
          ? null
          : RunNodeLog.fromJson(json['log'] as Map<String, dynamic>),
      (json['listCard'] as List)
          ?.map((e) =>
              e == null ? null : Card.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listSupervise'] as List)
          ?.map((e) =>
              e == null ? null : Supervise.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listChargeRe'] as List)
          ?.map((e) => e == null
              ? null
              : ChargeRelation.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listDelay'] as List)
          ?.map((e) =>
              e == null ? null : Delay.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listPause'] as List)
          ?.map((e) =>
              e == null ? null : Pause.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listOncetell'] as List)
          ?.map((e) =>
              e == null ? null : Oncetell.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listItemLicenceModel'] as List)
          ?.map((e) => e == null
              ? null
              : ItemLicenceModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listCustForm'] as List)
          ?.map((e) => e == null
              ? null
              : BusinessCustForm.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['itemdoStateIn'] as String,
      json['businessDoInfo'] as String,
      json['chargeType'] as String,
      (json['chargeMoneyFloat'] as num)?.toDouble(),
      json['isOncetell'] as String,
      json['oncetell'] == null
          ? null
          : Oncetell.fromJson(json['oncetell'] as Map<String, dynamic>),
      json['oncetellId'] as String,
      json['oncetellStime'] as String,
      json['oncetellOvertime'] as String,
      json['doUserName'] as String,
      json['delayId'] as String,
      json['delayAcceptTime'] as String,
      json['delayDayNum'] as String,
      json['verifyUserName'] as String,
      json['pauseId'] as String,
      json['pauseAcceptTime'] as String,
      json['userinfo'] == null
          ? null
          : UserInfo.fromJson(json['userinfo'] as Map<String, dynamic>),
      json['redNum'] as int,
      json['yellowNum'] as int,
      json['hurryNum'] as int,
      json['warningNum'] as int,
      json['sdate'] as String,
      json['edate'] as String,
      json['dosdate'] as String,
      json['doedate'] as String,
      json['derateMoney'] as String,
      json['sendbackMoney'] as String,
      json['factMoney'] as String,
      json['auditResults'] as String,
      json['oncetellLightState'] as String,
      json['userId'] as String,
      json['userName'] as String,
      json['companyName'] as String,
      (json['valueMap'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['stuffCatalogId'] as int,
      (json['listStuffCatalog'] as List)
          ?.map((e) => e == null
              ? null
              : StuffCatalog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['firstBusinessId'] as int,
      json['firstItemId'] as int,
      json['upBusinessId'] as int,
      (json['listRunNodeLog'] as List)
          ?.map((e) =>
              e == null ? null : RunNodeLog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['statePng'] as String,
      json['applicantItemId'] as int,
      json['source'] as String,
      json['investItemStateId'] as int,
      json['investStepStateId'] as int,
      json['appraiseType'] as String,
      json['callRegisterId'] as int,
      json['serchName'] as String,
      json['serviceObjectName'] as String,
      json['isPatrolShow'] as String,
      json['runNum'] as int,
      json['uniteStageName'] as String,
      json['consentLimit'] as int,
      json['expressTypeName'] as String,
      json['slbhOrCardNo'] as String,
      json['itemdoStateCN'] as String,
      json['handleNodeContent'] as String,
      json['saveDayNotHasHoliday'] as String,
      json['appraised'] as String,
      (json['listItemLicenceCatalog'] as List)
          ?.map((e) => e == null
              ? null
              : ItemLicenceCatalog.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['isAutoDone'] as String,
      json['taskCode'] as String,
      json['taskHandleItem'] as String);
}

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'regId': instance.regId,
      'depId': instance.depId,
      'itemId': instance.itemId,
      'itemNo': instance.itemNo,
      'donum': instance.donum,
      'slbh': instance.slbh,
      'acceptDate': instance.acceptDate,
      'acceptTime': instance.acceptTime,
      'doDate': instance.doDate,
      'doTime': instance.doTime,
      'saveTheDay': instance.saveTheDay,
      'warningDate': instance.warningDate,
      'consentDate': instance.consentDate,
      'legalDate': instance.legalDate,
      'itemdoState': instance.itemdoState,
      'bjbz': instance.bjbz,
      'proposerId': instance.proposerId,
      'acceptUserId': instance.acceptUserId,
      'doUserId': instance.doUserId,
      'ispick': instance.ispick,
      'runFlowId': instance.runFlowId,
      'chargeState': instance.chargeState,
      'chargeMoney': instance.chargeMoney,
      'itemCategory': instance.itemCategory,
      'itemType': instance.itemType,
      'oncetellState': instance.oncetellState,
      'shouldMoney': instance.shouldMoney,
      'webApplyId': instance.webApplyId,
      'serviceObject': instance.serviceObject,
      'fetchTime': instance.fetchTime,
      'isReceive': instance.isReceive,
      'receivTime': instance.receivTime,
      'receiveUserId': instance.receiveUserId,
      'receivIpInfo': instance.receivIpInfo,
      'isPush': instance.isPush,
      'pushDate': instance.pushDate,
      'isPrint': instance.isPrint,
      'uniteBusinessId': instance.uniteBusinessId,
      'pickUp': instance.pickUp,
      'pickUpUserName': instance.pickUpUserName,
      'pickUpAddress': instance.pickUpAddress,
      'pickUpPhone': instance.pickUpPhone,
      'expressNumber': instance.expressNumber,
      'expressType': instance.expressType,
      'rowGuid': instance.rowGuid,
      'projectNo': instance.projectNo,
      'cdSignAccept': instance.cdSignAccept,
      'cdSignEnd': instance.cdSignEnd,
      'projectNoState': instance.projectNoState,
      'postalCode': instance.postalCode,
      'appendixInfo': instance.appendixInfo,
      'proposer': instance.proposer,
      'companyLib': instance.companyLib,
      'companyno': instance.companyno,
      'personLib': instance.personLib,
      'proposerName': instance.proposerName,
      'cardNo': instance.cardNo,
      'linkUserName': instance.linkUserName,
      'phone': instance.phone,
      'parentRegId': instance.parentRegId,
      'itemName': instance.itemName,
      'regName': instance.regName,
      'depName': instance.depName,
      'zfjgDepId': instance.zfjgDepId,
      'zfjgDepName': instance.zfjgDepName,
      'acceptUserName': instance.acceptUserName,
      'receiveUserName': instance.receiveUserName,
      'itemWarState': instance.itemWarState,
      'nodeWarState': instance.nodeWarState,
      'doResultState': instance.doResultState,
      'doResultSituation': instance.doResultSituation,
      'stuffIds': instance.stuffIds,
      'listStuff': instance.listStuff,
      'listItemStuffNotUpload': instance.listItemStuffNotUpload,
      'stuffRelationId': instance.stuffRelationId,
      'listStuffRelation': instance.listStuffRelation,
      'stuffFileIds': instance.stuffFileIds,
      'listLicence': instance.listLicence,
      'qRCodeUrl': instance.qRCodeUrl,
      'flowId': instance.flowId,
      'logId': instance.logId,
      'nowNodeName': instance.nowNodeName,
      'toItemId': instance.toItemId,
      'toItemName': instance.toItemName,
      'thisNodeType': instance.thisNodeType,
      'item': instance.item,
      'runFlow': instance.runFlow,
      'log': instance.log,
      'listCard': instance.listCard,
      'listSupervise': instance.listSupervise,
      'listChargeRe': instance.listChargeRe,
      'listDelay': instance.listDelay,
      'listPause': instance.listPause,
      'listOncetell': instance.listOncetell,
      'listItemLicenceModel': instance.listItemLicenceModel,
      'listCustForm': instance.listCustForm,
      'itemdoStateIn': instance.itemdoStateIn,
      'businessDoInfo': instance.businessDoInfo,
      'chargeType': instance.chargeType,
      'chargeMoneyFloat': instance.chargeMoneyFloat,
      'isOncetell': instance.isOncetell,
      'oncetell': instance.oncetell,
      'oncetellId': instance.oncetellId,
      'oncetellStime': instance.oncetellStime,
      'oncetellOvertime': instance.oncetellOvertime,
      'doUserName': instance.doUserName,
      'delayId': instance.delayId,
      'delayAcceptTime': instance.delayAcceptTime,
      'delayDayNum': instance.delayDayNum,
      'verifyUserName': instance.verifyUserName,
      'pauseId': instance.pauseId,
      'pauseAcceptTime': instance.pauseAcceptTime,
      'userinfo': instance.userinfo,
      'redNum': instance.redNum,
      'yellowNum': instance.yellowNum,
      'hurryNum': instance.hurryNum,
      'warningNum': instance.warningNum,
      'sdate': instance.sdate,
      'edate': instance.edate,
      'dosdate': instance.dosdate,
      'doedate': instance.doedate,
      'derateMoney': instance.derateMoney,
      'sendbackMoney': instance.sendbackMoney,
      'factMoney': instance.factMoney,
      'auditResults': instance.auditResults,
      'oncetellLightState': instance.oncetellLightState,
      'userId': instance.userId,
      'userName': instance.userName,
      'companyName': instance.companyName,
      'valueMap': instance.valueMap,
      'stuffCatalogId': instance.stuffCatalogId,
      'listStuffCatalog': instance.listStuffCatalog,
      'firstBusinessId': instance.firstBusinessId,
      'firstItemId': instance.firstItemId,
      'upBusinessId': instance.upBusinessId,
      'listRunNodeLog': instance.listRunNodeLog,
      'statePng': instance.statePng,
      'applicantItemId': instance.applicantItemId,
      'source': instance.source,
      'investItemStateId': instance.investItemStateId,
      'investStepStateId': instance.investStepStateId,
      'appraiseType': instance.appraiseType,
      'callRegisterId': instance.callRegisterId,
      'serchName': instance.serchName,
      'serviceObjectName': instance.serviceObjectName,
      'isPatrolShow': instance.isPatrolShow,
      'runNum': instance.runNum,
      'uniteStageName': instance.uniteStageName,
      'consentLimit': instance.consentLimit,
      'expressTypeName': instance.expressTypeName,
      'slbhOrCardNo': instance.slbhOrCardNo,
      'itemdoStateCN': instance.itemdoStateCN,
      'handleNodeContent': instance.handleNodeContent,
      'saveDayNotHasHoliday': instance.saveDayNotHasHoliday,
      'appraised': instance.appraised,
      'listItemLicenceCatalog': instance.listItemLicenceCatalog,
      'isAutoDone': instance.isAutoDone,
      'taskCode': instance.taskCode,
      'taskHandleItem': instance.taskHandleItem
    };
