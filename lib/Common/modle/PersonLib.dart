import 'package:json_annotation/json_annotation.dart';

part 'PersonLib.g.dart';

@JsonSerializable()
class PersonLib {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 姓名
   */

  String userName;

  /**
   * 身份证号码
   */

  String cardNo;

  /**
   * 手机号码
   */

  String tel;

  /**
   * 座机号码
   */

  String phone;

  /**
   * 性别
   */

  String sex;

  /**
   * 邮箱
   */

  String email;

  /**
   * 通讯地址
   */

  String address;

  /**
   * 民族(参考字典表familyName)
   */

  String familyName;

  /**
   * 出生日期
   */

  String birthday;

  /**
   * 自然人状态
   */

  String naturalState;

  /**
   * 登录账号(默认身份证号码)
   */

  String loginName;

  /**
   * 登录密码
   */

  String password;

  /****************以上主要为系统表字段********************/

  /**
   * 历史办件数
   */
  int countHistory;

  /**
   * 材料证照数
   */
  int countStuff;

  /**
   * 网上预约数
   */
  int countBespeak;

  /**
   * 行业监管数
   */
  int countPatrol;

  /**
   * 行政处罚数
   */
  int countCases;

  /**
   * 证照数
   */
  int countLicence;

  /**
   * 材料复用字符串
   */
  String stuffStr;

  /**
   * 今日取号数量
   */
  int quHaoNum;

  /**
   * 个人最大取号数量
   */
  int limitNum;

  /****************以上为自己添加字段********************/

  PersonLib(
      this.id,
      this.recordCreateTime,
      this.userName,
      this.cardNo,
      this.tel,
      this.phone,
      this.sex,
      this.email,
      this.address,
      this.familyName,
      this.birthday,
      this.naturalState,
      this.loginName,
      this.password,
      this.countHistory,
      this.countStuff,
      this.countBespeak,
      this.countPatrol,
      this.countCases,
      this.countLicence,
      this.stuffStr,
      this.quHaoNum,
      this.limitNum);

  factory PersonLib.fromJson(Map<String, dynamic> srcJson) =>
      _$PersonLibFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonLibToJson(this);
}
