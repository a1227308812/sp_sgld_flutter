import 'package:json_annotation/json_annotation.dart';

part 'SuperBuspush.g.dart';

@JsonSerializable()
class SuperBuspush {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 办件ID
   */

  int businessId;

  /**
   * 推送部门ID
   */

  int depId;

  /**
   * 推送人ID
   */

  int userId;

  /**
   * 推送内容
   */

  String pushContent;

  /**
   * 认领状态
   */

  int claimState;

  /**
   * 认领人ID
   */

  int claimUser;

  /**
   * 认领时间
   */

  String claimTime;

  /**
   * 事项编号
   */

  String itemNo;

  /**
   * 认领人ip
   */

  String ip;

  /****************以上主要为系统表字段********************/

  /**
   * 事项名称
   */
  String itemName;

  /**
   * 推送部门名称
   */
  String depName;

  /**
   * 推送人姓名
   */
  String userName;

  /**
   * 认领人姓名
   */
  String claimUserName;

//  /**
//   * 办件信息
//   */
//   Business busienss;

  /**
   * 申请人姓名
   */
  String proposerName;

  /**
   * 推送开始日期（用于查询条件）
   */
  String sdate;

  /**
   * 推送结束日期（用于查询条件）
   */
  String edate;

  /**
   * 事项类型
   */
  String itemCategory;

  /**
   * 事项类别
   */
  String itemType;

  /**
   * 是否存在建议
   */
  String flag;

  /**
   * 处理结果
   */
  String treatmentResult;

  /**
   * 检查结果
   */
  String patrolResult;

  /**
   * 监管信息
   */
  int patrolId;

  String no;

  /**
   * 认领时限
   */
  int acceptLimit;

  //   List<RunNodeLog> listRunNodeLog;

  SuperBuspush(
      this.id,
      this.recordCreateTime,
      this.businessId,
      this.depId,
      this.userId,
      this.pushContent,
      this.claimState,
      this.claimUser,
      this.claimTime,
      this.itemNo,
      this.ip,
      this.itemName,
      this.depName,
      this.userName,
      this.claimUserName,
      this.proposerName,
      this.sdate,
      this.edate,
      this.itemCategory,
      this.itemType,
      this.flag,
      this.treatmentResult,
      this.patrolResult,
      this.patrolId,
      this.no,
      this.acceptLimit);

  factory SuperBuspush.fromJson(Map<String, dynamic> srcJson) =>
      _$SuperBuspushFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SuperBuspushToJson(this);
}
