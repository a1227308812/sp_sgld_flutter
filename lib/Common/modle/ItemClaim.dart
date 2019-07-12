import 'package:json_annotation/json_annotation.dart';

part 'ItemClaim.g.dart';

@JsonSerializable()
class ItemClaim  {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'recordCreateTime')
  String recordCreateTime;

  @JsonKey(name: 'businessId')
  int businessId;

  @JsonKey(name: 'depId')
  int depId;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'pushContent')
  String pushContent;

  @JsonKey(name: 'claimState')
  int claimState;

  @JsonKey(name: 'itemNo')
  String itemNo;

  @JsonKey(name: 'itemName')
  String itemName;

  @JsonKey(name: 'depName')
  String depName;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'proposerName')
  String proposerName;

  ItemClaim(
    this.id,
    this.recordCreateTime,
    this.businessId,
    this.depId,
    this.userId,
    this.pushContent,
    this.claimState,
    this.itemNo,
    this.itemName,
    this.depName,
    this.userName,
    this.proposerName,
  );

  factory ItemClaim.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemClaimFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemClaimToJson(this);
}
