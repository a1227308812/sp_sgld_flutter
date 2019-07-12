// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PageResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResult _$PageResultFromJson(Map<String, dynamic> json) {
  return PageResult(json['allPage'] as int, json['allCount'] as int,
      json['listData'] as List);
}

Map<String, dynamic> _$PageResultToJson(PageResult instance) =>
    <String, dynamic>{
      'allPage': instance.allPage,
      'allCount': instance.allCount,
      'listData': instance.listData
    };
