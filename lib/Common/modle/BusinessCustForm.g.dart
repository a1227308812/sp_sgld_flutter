// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BusinessCustForm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessCustForm _$BusinessCustFormFromJson(Map<String, dynamic> json) {
  return BusinessCustForm(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['businessId'] as int,
      json['custFormId'] as int,
      json['custFormName'] as String,
      json['direction'] as String,
      json['pageNum'] as String,
      json['backImage'] as String,
      json['custXml'] as String);
}

Map<String, dynamic> _$BusinessCustFormToJson(BusinessCustForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'businessId': instance.businessId,
      'custFormId': instance.custFormId,
      'custFormName': instance.custFormName,
      'direction': instance.direction,
      'pageNum': instance.pageNum,
      'backImage': instance.backImage,
      'custXml': instance.custXml
    };
