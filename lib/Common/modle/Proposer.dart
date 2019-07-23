import 'package:json_annotation/json_annotation.dart';

part 'Proposer.g.dart';

@JsonSerializable()
class Proposer {
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
   * 手机号码
   */

  String userTel;

  /**
   * 身份证号码
   */

  String userCardNo;

  /**
   * 申请人通讯地址
   */

  String userAddress;

  /**
   * 申请人性别
   */

  String userSex;

  /**
   * 申请人座机号码
   */

  String userPhone;

  /**
   * 申请人邮箱
   */

  String userEmail;

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
   * 企业名称
   */

  String companyName;

  /**
   * 企业类型参考字典表companyType
   */

  String companyType;

  /**
   * 企业类型代码
   */

  String companyTypeCode;

  /**
   * 法定代表人
   */

  String companyLegalPersonName;

  /**
   * 法定代表人身份证号
   */

  String companyLegalPersonCardNo;

  /**
   * 统一社会信用代码
   */

  String companyNo;

  /**
   * 组织机构代码
   */

  String orgCode;

  /**
   * 注册地址
   */

  String companyAddress;

  /**
   * 注册日期
   */

  String companyRegDate;

  /**
   * 经营范围
   */

  String businessScope;

  /**
   * 许可经营项目
   */

  String managementProject;

  /**
   * 注册资本
   */

  String companyRegisterMoney;

  /**
   * 实收资本
   */

  String companyRealMoney;

  /**
   * 行业类型
   */

  String companyTradeType;

  /**
   * 行业小类
   */

  String companyTradeSmall;

  /**
   * 营业期限起
   */

  String companyStartDate;

  /**
   * 营业期限止
   */

  String companyEndDate;

  /**
   * 核准日期
   */

  String companyCheckDate;

  /**
   * 登记机关
   */

  String companyRegOrg;

  /**
   * 企业邮箱
   */

  String companyEmail;

  /**
   * 联系电话
   */

  String companyPhone;

  /**
   * 企业状态
   */

  String companyState;

  /**
   * 联系人姓名
   */

  String linkUserName;

  /**
   * 联系人手机号码
   */

  String linkTel;

  /**
   * 联系人身份证号码
   */

  String linkCardNo;

  /**
   * 联系人通讯地址
   */

  String linkAddress;

  /**
   * 联系人性别
   */

  String linkSex;

  /**
   * 联系人座机号码
   */

  String linkPhone;

  /**
   * 联系人邮箱
   */

  String linkEmail;

  /**
   * 联系人邮编
   */

  String linkPostcode;

  /****************以上主要为系统表字段********************/

  /**
   * 性别
   */
  String userSexName;

  String linkSexName;

  String picCode;

  /****************以上为自己添加字段********************/

  Proposer(
      this.id,
      this.recordCreateTime,
      this.userName,
      this.userTel,
      this.userCardNo,
      this.userAddress,
      this.userSex,
      this.userPhone,
      this.userEmail,
      this.familyName,
      this.birthday,
      this.naturalState,
      this.companyName,
      this.companyType,
      this.companyTypeCode,
      this.companyLegalPersonName,
      this.companyLegalPersonCardNo,
      this.companyNo,
      this.orgCode,
      this.companyAddress,
      this.companyRegDate,
      this.businessScope,
      this.managementProject,
      this.companyRegisterMoney,
      this.companyRealMoney,
      this.companyTradeType,
      this.companyTradeSmall,
      this.companyStartDate,
      this.companyEndDate,
      this.companyCheckDate,
      this.companyRegOrg,
      this.companyEmail,
      this.companyPhone,
      this.companyState,
      this.linkUserName,
      this.linkTel,
      this.linkCardNo,
      this.linkAddress,
      this.linkSex,
      this.linkPhone,
      this.linkEmail,
      this.linkPostcode,
      this.userSexName,
      this.linkSexName,
      this.picCode);

  factory Proposer.fromJson(Map<String, dynamic> srcJson) =>
      _$ProposerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProposerToJson(this);
}
