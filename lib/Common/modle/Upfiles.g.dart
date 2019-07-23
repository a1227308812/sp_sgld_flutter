// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Upfiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upfiles _$UpfilesFromJson(Map<String, dynamic> json) {
  return Upfiles(
      json['id'] as int,
      json['recordCreateTime'] as String,
      json['fileExt'] as String,
      json['filename'] as String,
      json['filepath'] as String,
      json['sizeb'] as int,
      json['sizem'] as String,
      json['uuid'] as String,
      json['picWidth'] as int,
      json['picHeight'] as int,
      json['stuffId'] as int);
}

Map<String, dynamic> _$UpfilesToJson(Upfiles instance) => <String, dynamic>{
      'id': instance.id,
      'recordCreateTime': instance.recordCreateTime,
      'fileExt': instance.fileExt,
      'filename': instance.filename,
      'filepath': instance.filepath,
      'sizeb': instance.sizeb,
      'sizem': instance.sizem,
      'uuid': instance.uuid,
      'picWidth': instance.picWidth,
      'picHeight': instance.picHeight,
      'stuffId': instance.stuffId
    };
