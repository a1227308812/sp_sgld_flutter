import 'package:json_annotation/json_annotation.dart';

import 'ItemStuff.dart';

part 'StuffCatalog.g.dart';

@JsonSerializable()
class StuffCatalog {
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
   * 关联uniteItem表ID
   */

  int uniteItemId;

  /**
   * 目录名称
   */

  String catalogName;

  /****************以上主要为系统表字段********************/

  /**
   * 申报材料
   */
  List<ItemStuff> listItemStuff;

  /**
   * 材料的数量
   */
  int stuffNum;

  int stuffNumNotUpload;

  /****************以上为自己添加字段********************/


  StuffCatalog(this.id, this.recordCreateTime, this.itemId, this.uniteItemId,
      this.catalogName, this.listItemStuff, this.stuffNum,
      this.stuffNumNotUpload);

  factory StuffCatalog.fromJson(Map<String, dynamic> srcJson) =>
      _$StuffCatalogFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StuffCatalogToJson(this);
}
