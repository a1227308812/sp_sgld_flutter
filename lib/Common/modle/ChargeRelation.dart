import 'package:json_annotation/json_annotation.dart';

part 'ChargeRelation.g.dart';

@JsonSerializable()
class ChargeRelation {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 收费项目表Id
   */

  int itemChargeId;

  /**
   * 办件信息表Id
   */

  int businessId;

  /**
   * 单价
   */

  String price;

  /**
   * 数量
   */

  String num;

  /**
   * 应收金额
   */

  String shouldMoney;

  /**
   * 减免金额
   */

  String derateMoney;

  /**
   * 收费金额
   */

  String chargeMoney;

  /**
   * 退费金额
   */

  String sendbackMoney;

  /**
   * 实收金额
   */

  String factMoney;

  /**
   * 新增收费人
   */

  int acceptUserid;

  /**
   * 新增收费时间
   */

  String acceptTime;

  /**
   * 确认收费人
   */

  int doUserid;

  /**
   * 确认收费时间
   */

  String doTime;

  /****************以上主要为系统表字段********************/

  String chargeNo;

  String chargeName;

  String chargeUpper;

  String chargeLower;

  String isDesc;

  List<ChargeRelation> listChargeRe;


  ChargeRelation(this.id, this.recordCreateTime, this.itemChargeId,
      this.businessId, this.price, this.num, this.shouldMoney, this.derateMoney,
      this.chargeMoney, this.sendbackMoney, this.factMoney, this.acceptUserid,
      this.acceptTime, this.doUserid, this.doTime, this.chargeNo,
      this.chargeName, this.chargeUpper, this.chargeLower, this.isDesc,
      this.listChargeRe);

  factory ChargeRelation.fromJson(Map<String, dynamic> srcJson) =>
      _$ChargeRelationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChargeRelationToJson(this);
}
