// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemLicenceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLicenceModel _$ItemLicenceModelFromJson(Map<String, dynamic> json) {
  return ItemLicenceModel(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['itemId'] as int,
      json['modelId'] as int,
      json['modelName'] as String,
      json['modelSize'] as String,
      json['modelWidth'] as String,
      json['modelHeight'] as String,
      json['uuid'] as String,
      json['fileName'] as String);
}

Map<String, dynamic> _$ItemLicenceModelToJson(ItemLicenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'itemId': instance.itemId,
      'modelId': instance.modelId,
      'modelName': instance.modelName,
      'modelSize': instance.modelSize,
      'modelWidth': instance.modelWidth,
      'modelHeight': instance.modelHeight,
      'uuid': instance.uuid,
      'fileName': instance.fileName
    };
