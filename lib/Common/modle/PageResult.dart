import 'package:json_annotation/json_annotation.dart';

part 'PageResult.g.dart';

@JsonSerializable()
class PageResult {

  @JsonKey(name: 'allPage')
  int allPage;

  @JsonKey(name: 'allCount')
  int allCount;

  @JsonKey(name: 'listData')
  List listData;

  PageResult(this.allPage,this.allCount,this.listData,);

  factory PageResult.fromJson(Map<String, dynamic> srcJson) => _$PageResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PageResultToJson(this);

}