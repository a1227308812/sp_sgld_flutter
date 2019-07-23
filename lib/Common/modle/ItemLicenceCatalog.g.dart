// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemLicenceCatalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLicenceCatalog _$ItemLicenceCatalogFromJson(Map<String, dynamic> json) {
  return ItemLicenceCatalog(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['itemId'] as int,
      json['licenceCatalogId'] as int,
      json['licenceState'] as String,
      json['itemName'] as String,
      json['catalogName'] as String,
      json['catalogType'] as String,
      json['holderType'] as String,
      json['recordUser'] as String,
      json['regId'] as String,
      json['depId'] as String,
      json['depName'] as String);
}

Map<String, dynamic> _$ItemLicenceCatalogToJson(ItemLicenceCatalog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'itemId': instance.itemId,
      'licenceCatalogId': instance.licenceCatalogId,
      'licenceState': instance.licenceState,
      'itemName': instance.itemName,
      'catalogName': instance.catalogName,
      'catalogType': instance.catalogType,
      'holderType': instance.holderType,
      'recordUser': instance.recordUser,
      'regId': instance.regId,
      'depId': instance.depId,
      'depName': instance.depName
    };
