import 'package:json_annotation/json_annotation.dart';

part 'ItemLicenceCatalog.g.dart';

@JsonSerializable()
class ItemLicenceCatalog {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 事项ID
   */

  int itemId;

  /**
   * 证照目录ID
   */

  int licenceCatalogId;

  /**
   * 证件状态 1新增 2变更 3年检 4注销
   */

  String licenceState;

  /****************以上主要为系统表字段********************/

  /**
   * 事项名称
   */
  String itemName;

  String catalogName;

  String catalogType;

  String holderType;

  String recordUser;

  String regId;

  String depId;

  String depName;

  /****************以上为自己添加字段********************/

  ItemLicenceCatalog(this.id, this.recordCreateTime, this.itemId,
      this.licenceCatalogId, this.licenceState, this.itemName, this.catalogName,
      this.catalogType, this.holderType, this.recordUser, this.regId,
      this.depId, this.depName);

  factory ItemLicenceCatalog.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemLicenceCatalogFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemLicenceCatalogToJson(this);
}
