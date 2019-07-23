import 'package:json_annotation/json_annotation.dart';

part 'ItemLicenceModel.g.dart';

@JsonSerializable()
class ItemLicenceModel {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 关联item表ID
   */

  int itemId;

  /**
   * 证照模板ID
   */

  int modelId;

  /****************以上主要为系统表字段********************/

  String modelName;

  String modelSize;

  String modelWidth;

  String modelHeight;

  /**
   * 背景图uuid
   */
  String uuid;

  /**
   * 背景图名称
   */
  String fileName;

  /****************以上为自己添加字段********************/

  ItemLicenceModel(
      this.id,
      this.recordCreateTime,
      this.itemId,
      this.modelId,
      this.modelName,
      this.modelSize,
      this.modelWidth,
      this.modelHeight,
      this.uuid,
      this.fileName);

  factory ItemLicenceModel.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemLicenceModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemLicenceModelToJson(this);
}
