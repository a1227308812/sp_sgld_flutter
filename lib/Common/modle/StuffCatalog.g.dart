// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StuffCatalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StuffCatalog _$StuffCatalogFromJson(Map<String, dynamic> json) {
  return StuffCatalog(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['itemId'] as int,
      json['uniteItemId'] as int,
      json['catalogName'] as String,
      (json['listItemStuff'] as List)
          ?.map((e) =>
              e == null ? null : ItemStuff.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['stuffNum'] as int,
      json['stuffNumNotUpload'] as int);
}

Map<String, dynamic> _$StuffCatalogToJson(StuffCatalog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'itemId': instance.itemId,
      'uniteItemId': instance.uniteItemId,
      'catalogName': instance.catalogName,
      'listItemStuff': instance.listItemStuff,
      'stuffNum': instance.stuffNum,
      'stuffNumNotUpload': instance.stuffNumNotUpload
    };
