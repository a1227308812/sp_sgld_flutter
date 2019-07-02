import 'package:json_annotation/json_annotation.dart';
import 'package:sp_sgld_flutter/Common/modle/ListRole.dart';

part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'recordCreateTime')
  String recordCreateTime;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'loginName')
  String loginName;

  @JsonKey(name: 'enabled')
  String enabled;

  @JsonKey(name: 'allSpelling')
  String allSpelling;

  @JsonKey(name: 'firstSpelling')
  String firstSpelling;

  @JsonKey(name: 'regId')
  int regId;

  @JsonKey(name: 'depId')
  int depId;

  @JsonKey(name: 'jobNo')
  String jobNo;

  @JsonKey(name: 'cloudDiskSize')
  int cloudDiskSize;

  @JsonKey(name: 'cloudDiskUsedSize')
  double cloudDiskUsedSize;

  @JsonKey(name: 'enabledName')
  String enabledName;

  @JsonKey(name: 'listRole')
  List<ListRole> listRole;

  @JsonKey(name: 'listPosition')
  List<dynamic> listPosition;

  @JsonKey(name: 'ifOnline')
  String ifOnline;

  @JsonKey(name: 'ifNeedChangePWD')
  bool ifNeedChangePWD;

  @JsonKey(name: 'depName')
  String depName;

  @JsonKey(name: 'depType')
  String depType;

  @JsonKey(name: 'regName')
  String regName;

  @JsonKey(name: 'depPathName')
  String depPathName;

  @JsonKey(name: 'addPercent')
  double addPercent;

  @JsonKey(name: 'authKey')
  String authKey;

  @JsonKey(name: 'sid')
  String sid;

  UserInfo(
    this.id,
    this.recordCreateTime,
    this.password,
    this.userName,
    this.loginName,
    this.enabled,
    this.allSpelling,
    this.firstSpelling,
    this.regId,
    this.depId,
    this.jobNo,
    this.cloudDiskSize,
    this.cloudDiskUsedSize,
    this.enabledName,
    this.listRole,
    this.listPosition,
    this.ifOnline,
    this.ifNeedChangePWD,
    this.depName,
    this.depType,
    this.regName,
    this.depPathName,
    this.addPercent,
    this.authKey,
    this.sid,
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
