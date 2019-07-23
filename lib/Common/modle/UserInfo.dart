import 'package:json_annotation/json_annotation.dart';

import 'Position.dart';
import 'Role.dart';

part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 用户密码 MD5加密
   */

  String password;

  /**
   * 用户名
   */

  String userName;

  /**
   * 职务
   */

  String job;

  /**
   * 登录名
   */

  String loginName;

  /**
   * 启用状态  参见数据字典enabled
   */

  String enabled;

  /**
   * 拼音 全拼
   */

  String allSpelling;

  /**
   * 拼音 首字母
   */

  String firstSpelling;

  /**
   * 手机号码
   */

  String mobilePhone;

  /**
   * 办公电话
   */

  String officePhone;

  /**
   * 用户所在地区
   */

  int regId;

  /**
   * 用户所在部门
   */

  int depId;

  /**
   * 用户特殊权限，请参考字典表userSpeRoute
   */

  String userSpeRoute;

  /**
   * 考勤号
   */

  String checkNum;

  /**
   * 取号窗口
   */

  int callWindowId;

  /**
   * 工号
   */

  String jobNo;

  /**
   * 人员照片关联upfiles表ID
   */

  int upfilesId;

  /**
   * 省中心人员编号
   */

  String upWorkerCode;

  /**
   * 身份证号
   */

  String cardNo;

  /**
   * 邮箱
   */

  String email;

  /**
   * 是否值班人员0不是1是
   */

  String isWorkUser;

  /**
   * 政务云盘空间大小（单位G），默认1G
   */

  int cloudDiskSize;

  /**
   * 政务云盘已使用空间大小（单位M）
   */

  double cloudDiskUsedSize;

  /**
   * 中心收件人姓名
   */

  String emsUserNameCenter;

  /**
   * 中心收件人手机号
   */

  String emsUserTelCenter;

  /**
   * 中心收件人地址
   */

  String emsAddressCenter;

  /**
   * 岗位
   */

  String post;

  /****************以上主要为系统表字段********************/

  /**
   * 信用平台tokenId
   */
  String creditTokenId;

  /**
   * 在线投资平台tokenId
   */
  String investmentTokenId;

  /**
   * 1为暂停
   */
  int pause;

  String callWindowNo;

  /**
   * 取号区域名称名称
   */
  String areaName;

  /**
   * 取号窗口名称
   */
  String callWindowName;

  /**
   * 取号窗口名称(别名)
   */
  String callOtherName;

  /**
   * 登录名
   */
  String newLoginName;

  String enabledName;

  /**
   * 所属角色列表（用于查询）
   */
  List<Role> listRole;

  String roleids;

  /**
   * 所属岗位列表
   */
  List<Position> listPosition;

  /**
   * 是否在线0否1是2表示查询所有
   */
  String ifOnline;

  /**
   * 需要查询的用户ids
   */
  List<String> userIds;

  /**
   * 重复密码（密码修改时使用）
   */
  String password2;

  /**
   * 是否需要修改密码
   */
  bool ifNeedChangePWD;

  /**
   * 原密码（密码修改时使用）
   */
  String oldPassword;

  /**
   * 所属部门
   */
  String depName;

  /**
   * 所属部门类别
   */
  String depType;

  String depTypes;

  /**
   * 所属地区
   */
  String regName;

  /**
   * 地区+部门
   */
  String depPathName;

  /**
   * 节点ID（在维护项目流程的时候，选择候选人，如果节点ID不为空，则默认显示为当前节点所在部门的人员）
   */
  int nodeId;

  String businessType;

  /**
   * 人员图片
   */
  String upfilesName;

  /**
   * 人员图片路径
   */
  String upfilesPath;

  /**
   * 人员图片UUID
   */
  String upfilesUuid;

  /**
   * 是否是窗口人员用于请假 0：否 1：是
   */
  String isCallWindowUser;

  /**
   * 人员办件量
   */
  String bjNum;

  /**
   * 人员提前办件量
   */
  String tqNum;

  /**
   * 人员提前办结率
   */
  String tqPercent;

  /**
   * 当月办件量
   */
  String nowMonthNum;

  /**
   * 前三个月平均办结量
   */
  String avgThreeMonthNum;

  /**
   * 当月相比前三个月平均办结量的增长率
   */
  double addPercent;

  /**
   * 迟到次数
   */
  String lateNum;

  /**
   * 早退次数
   */
  String earlyNum;

  /**
   * app登录key
   */
  String authKey;

  String sid;

  String isSpecil;

  /****************以上为自己添加字段********************/

  UserInfo(
      this.id,
      this.recordCreateTime,
      this.password,
      this.userName,
      this.job,
      this.loginName,
      this.enabled,
      this.allSpelling,
      this.firstSpelling,
      this.mobilePhone,
      this.officePhone,
      this.regId,
      this.depId,
      this.userSpeRoute,
      this.checkNum,
      this.callWindowId,
      this.jobNo,
      this.upfilesId,
      this.upWorkerCode,
      this.cardNo,
      this.email,
      this.isWorkUser,
      this.cloudDiskSize,
      this.cloudDiskUsedSize,
      this.emsUserNameCenter,
      this.emsUserTelCenter,
      this.emsAddressCenter,
      this.post,
      this.creditTokenId,
      this.investmentTokenId,
      this.pause,
      this.callWindowNo,
      this.areaName,
      this.callWindowName,
      this.callOtherName,
      this.newLoginName,
      this.enabledName,
      this.listRole,
      this.roleids,
      this.listPosition,
      this.ifOnline,
      this.password2,
      this.ifNeedChangePWD,
      this.oldPassword,
      this.depName,
      this.depType,
      this.depTypes,
      this.regName,
      this.depPathName,
      this.nodeId,
      this.businessType,
      this.upfilesName,
      this.upfilesPath,
      this.upfilesUuid,
      this.isCallWindowUser,
      this.bjNum,
      this.tqNum,
      this.tqPercent,
      this.nowMonthNum,
      this.avgThreeMonthNum,
      this.addPercent,
      this.lateNum,
      this.earlyNum,
      this.authKey,
      this.sid,
      this.isSpecil);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
