import 'package:json_annotation/json_annotation.dart';

part 'Oncetell.g.dart';

@JsonSerializable()
class Oncetell {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 办件信息表Id
   */

  int businessId;

  /**
   * 告知时间
   */

  String stime;

  /**
   * 到期时间
   */

  String overtime;

  /**
   * 结束启动补办时间
   */

  String etime;

  /**
   * 告知内容
   */

  String content;

  /**
   * 状态 1补办中2已启动3作废
   */

  String state;

  /**
   * 告知办理人
   */

  int douserId;

  /****************以上主要为系统表字段********************/

  String doUserName;

  /****************以上为自己添加字段********************/

  Oncetell(
      this.id,
      this.recordCreateTime,
      this.businessId,
      this.stime,
      this.overtime,
      this.etime,
      this.content,
      this.state,
      this.douserId,
      this.doUserName);

  factory Oncetell.fromJson(Map<String, dynamic> srcJson) =>
      _$OncetellFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OncetellToJson(this);
}
