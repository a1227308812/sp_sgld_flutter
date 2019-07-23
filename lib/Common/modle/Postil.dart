import 'package:json_annotation/json_annotation.dart';

part 'Postil.g.dart';

@JsonSerializable()
class Postil{
  /**
   * id主键
   */
   int id;

  /**
   * 记录创建时间
   */
   String recordCreateTime;

  /**
   * 申报材料表Id
   */
   int stuffId;

  /**
   * 办件信息表Id
   */
   int businessId;

  /**
   * 批注内容
   */
   String content;

  /**
   * 批注的人
   */
   int userId;

  /**
   * 批注的时间
   */
   String postilDateTime;

  /****************以上主要为系统表字段********************/

  /**
   * 批注人头像
   */
   String userImgUuid;

  /**
   * 批注人姓名
   */
   String userName;

  /**
   * 批注材料名称
   */
   String stuffName;

/****************以上为自己添加字段********************/


   Postil(this.id, this.recordCreateTime, this.stuffId, this.businessId,
       this.content, this.userId, this.postilDateTime, this.userImgUuid,
       this.userName, this.stuffName);

   factory Postil.fromJson(Map<String, dynamic> srcJson) =>
       _$PostilFromJson(srcJson);

   Map<String, dynamic> toJson() => _$PostilToJson(this);
}