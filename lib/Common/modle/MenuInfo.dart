import 'package:json_annotation/json_annotation.dart';

part 'MenuInfo.g.dart';

@JsonSerializable()
class MenuInfo {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'parentId')
  int parentId;

  @JsonKey(name: 'maintainable')
  String maintainable;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'zvalue')
  String zvalue;

  @JsonKey(name: 'zdescribe')
  String zdescribe;

  @JsonKey(name: 'level')
  int level;

  MenuInfo(
    this.id,
    this.parentId,
    this.maintainable,
    this.type,
    this.code,
    this.zvalue,
    this.zdescribe,
    this.level,
  );

  factory MenuInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$MenuInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenuInfoToJson(this);
}
