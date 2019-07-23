// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemStuff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStuff _$ItemStuffFromJson(Map<String, dynamic> json) {
  return ItemStuff(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['itemId'] as int,
      json['uniteItemId'] as int,
      json['stuffName'] as String,
      json['stuffType'] as String,
      json['isNeed'] as String,
      json['stuffCatalogId'] as int,
      json['sampleTable'] as String,
      json['source'] as String,
      json['notice'] as String,
      json['acceptStandard'] as String,
      json['byLaw'] as String,
      json['orderNum'] as int,
      json['pageNum'] as int,
      json['pageFormat'] as String,
      json['materialFormat'] as String,
      json['paperMaterialType'] as String,
      json['masterNum'] as int,
      json['copyNum'] as int,
      json['materialGuid'] as String,
      json['elecForm'] as String,
      json['isPush'] as String,
      json['isCheck'] as String,
      json['stuffRelationId'] as int,
      json['stuffRegisterId'] as int,
      json['fileIds'] as String,
      json['stuffFileNum'] as String,
      json['postilNum'] as int,
      json['itemNo'] as String,
      (json['listUpFiles'] as List)
          ?.map((e) =>
              e == null ? null : Upfiles.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['listPostil'] as List)
          ?.map((e) =>
              e == null ? null : Postil.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['applyFiles'] as String,
      json['registerFiles'] as String,
      json['uniteItemStuffId'] as int);
}

Map<String, dynamic> _$ItemStuffToJson(ItemStuff instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'itemId': instance.itemId,
      'uniteItemId': instance.uniteItemId,
      'stuffName': instance.stuffName,
      'stuffType': instance.stuffType,
      'isNeed': instance.isNeed,
      'stuffCatalogId': instance.stuffCatalogId,
      'sampleTable': instance.sampleTable,
      'source': instance.source,
      'notice': instance.notice,
      'acceptStandard': instance.acceptStandard,
      'byLaw': instance.byLaw,
      'orderNum': instance.orderNum,
      'pageNum': instance.pageNum,
      'pageFormat': instance.pageFormat,
      'materialFormat': instance.materialFormat,
      'paperMaterialType': instance.paperMaterialType,
      'masterNum': instance.masterNum,
      'copyNum': instance.copyNum,
      'materialGuid': instance.materialGuid,
      'elecForm': instance.elecForm,
      'isPush': instance.isPush,
      'isCheck': instance.isCheck,
      'stuffRelationId': instance.stuffRelationId,
      'stuffRegisterId': instance.stuffRegisterId,
      'fileIds': instance.fileIds,
      'stuffFileNum': instance.stuffFileNum,
      'postilNum': instance.postilNum,
      'itemNo': instance.itemNo,
      'listUpFiles': instance.listUpFiles,
      'listPostil': instance.listPostil,
      'applyFiles': instance.applyFiles,
      'registerFiles': instance.registerFiles,
      'uniteItemStuffId': instance.uniteItemStuffId
    };
