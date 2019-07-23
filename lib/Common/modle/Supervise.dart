import 'package:json_annotation/json_annotation.dart';

part 'Supervise.g.dart';

@JsonSerializable()
class Supervise {
  /**
   * id主键
   */
  int id;

  /**
   * 被督办的办件Id
   */

  int businessId;

  /**
   * 督办时间
   */

  String superviseTime;

  /**
   * 督办内容
   */

  String content;

  /**
   * 督办人Id
   */

  int sendUserId;

  /**
   * 被督办人Id
   */

  int acceptUserId;

  /**
   * 督办人的回复
   */
  String answer;

  /**
   * 流程日志的节点id
   */
  int logId;

  /****************以上主要为系统表字段********************/

  /**
   * 督办的项目编号
   */
  String SLBH;

  /**
   * 督办的项目名字
   */
  String itemName;

  /**
   * 被督办人的名字
   */
  String acceptUserName;

  /**
   * 督办人的名字
   */
  String sendUserName;

  /**
   * 督办的项目受理日期
   */
  String acceptDate;

  /**
   * 督办的项目承诺日期
   */
  String consentDate;

  /**
   * 被督办人的行政区划
   */
  String acceptRegName;

  /**
   * 被督办人的部门名字
   */
  String acceptDepName;

  /**
   * 督办人的行政区划
   */
  String sendRegName;

  /**
   * 督办人的部门名字
   */
  String sendDepName;

  /**
   * 督办的开始时间
   */
  String sdate;

  /**
   * 督办的结束时间
   */
  String edate;

  /**
   * 督办节点
   */
  String nodeName;

  /****************以上为自己添加字段********************/


  Supervise(this.id, this.businessId, this.superviseTime, this.content,
      this.sendUserId, this.acceptUserId, this.answer, this.logId, this.SLBH,
      this.itemName, this.acceptUserName, this.sendUserName, this.acceptDate,
      this.consentDate, this.acceptRegName, this.acceptDepName,
      this.sendRegName, this.sendDepName, this.sdate, this.edate,
      this.nodeName);

  factory Supervise.fromJson(Map<String, dynamic> srcJson) =>
      _$SuperviseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SuperviseToJson(this);
}
