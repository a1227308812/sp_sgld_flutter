import 'package:json_annotation/json_annotation.dart';

part 'CompanyLib.g.dart';

@JsonSerializable()
class CompanyLib{
  /**
   * id主键
   */
   int id;

  /**
   * 记录创建时间
   */
   String recordCreateTime;

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
   * 统一社会信用代码
   */
  
   String companyNo;

  /**
   * 组织机构代码
   */
  
   String orgCode;

  /**
   * 法定代表人
   */
  
   String companyLegalPersonName;

  /**
   * 法定代表人身份证号
   */
  
   String companyLegalPersonCardNo;

  /**
   * 注册资本
   */
  
   String companyRegisterMoney;

  /**
   * 实收资本
   */
  
   String companyRealMoney;

  /**
   * 注册地址
   */
  
   String companyAddress;

  /**
   * 经营范围
   */
  
   String businessScope;

  /**
   * 许可经营项目
   */
  
   String managementProject;

  /**
   * 注册日期
   */
  
   String companyRegDate;

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
   * 联系电话
   */
  
   String companyPhone;

  /**
   * 企业邮箱
   */
  
   String companyEmail;

  /**
   * 企业状态
   */
  
   String companyState;

  /**
   * 注册人手机号码绑定
   */
  
   String companyTel;

  /**
   * 登录账号(默认是信用代码)
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
   * 材料数
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

/****************以上为自己添加字段********************/


   CompanyLib(this.id, this.recordCreateTime, this.companyName,
       this.companyType, this.companyTypeCode, this.companyNo, this.orgCode,
       this.companyLegalPersonName, this.companyLegalPersonCardNo,
       this.companyRegisterMoney, this.companyRealMoney, this.companyAddress,
       this.businessScope, this.managementProject, this.companyRegDate,
       this.companyTradeType, this.companyTradeSmall, this.companyStartDate,
       this.companyEndDate, this.companyCheckDate, this.companyRegOrg,
       this.companyPhone, this.companyEmail, this.companyState, this.companyTel,
       this.loginName, this.password, this.countHistory, this.countStuff,
       this.countBespeak, this.countPatrol, this.countCases, this.countLicence,
       this.stuffStr);

   factory CompanyLib.fromJson(Map<String, dynamic> srcJson) =>
       _$CompanyLibFromJson(srcJson);

   Map<String, dynamic> toJson() => _$CompanyLibToJson(this);
}