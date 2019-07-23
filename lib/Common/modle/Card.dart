import 'package:json_annotation/json_annotation.dart';

part 'Card.g.dart';

@JsonSerializable()
class Card {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 被发牌的办件Id
   */

  int businessId;

  /**
   * 发牌时间
   */

  String sendTime;

  /**
   * 发牌类别（0:红，1:黄，2:催办，3:乱收费警告）
   */

  String cardType;

  /**
   * 发牌理由
   */

  String content;

  /**
   * 被发牌人Id
   */

  int acceptUserId;

  /**
   * 被发牌人部门Id
   */

  int acceptDepId;

  /**
   * 被发牌人区划Id
   */

  int acceptRegId;

  /**
   * 被发牌人名称
   */

  String acceptUserName;

  /**
   * 被发牌人部门名称
   */

  String acceptDepName;

  /**
   * 被发牌人区划名称
   */

  String acceptRegName;

  /**
   * 发牌人Id，为0的时候表示系统发牌
   */

  int sendUserId;

  /**
   * 发牌人名称
   */

  String sendUserName;

  /**
   * 发牌人区划名称
   */

  String sendRegName;

  /**
   * 发牌人部门名称
   */

  String sendDepName;

  /**
   * 被发牌的环节日志Id
   */

  int logId;

  /****************以上主要为系统表字段********************/

  String nodeName;

  String slbh;

  String businessAcceptDateTime;

  String businessConsentDate;

  String businessAcceptUserName;

  String businessAcceptUserDepName;

  String businessAcceptUserRegName;

  String itemName;

  String sdate;

  String edate;

  /**
   * 发牌人手机端需要
   */
  String mobileSendUserName;

  /****************以上为自己添加字段********************/


  Card(this.id, this.recordCreateTime, this.businessId, this.sendTime,
      this.cardType, this.content, this.acceptUserId, this.acceptDepId,
      this.acceptRegId, this.acceptUserName, this.acceptDepName,
      this.acceptRegName, this.sendUserId, this.sendUserName, this.sendRegName,
      this.sendDepName, this.logId, this.nodeName, this.slbh,
      this.businessAcceptDateTime, this.businessConsentDate,
      this.businessAcceptUserName, this.businessAcceptUserDepName,
      this.businessAcceptUserRegName, this.itemName, this.sdate, this.edate,
      this.mobileSendUserName);

  factory Card.fromJson(Map<String, dynamic> srcJson) =>
      _$CardFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}
