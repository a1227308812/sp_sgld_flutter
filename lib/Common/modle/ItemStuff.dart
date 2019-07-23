import 'package:json_annotation/json_annotation.dart';

import 'Postil.dart';
import 'Upfiles.dart';

part 'ItemStuff.g.dart';

@JsonSerializable()
class ItemStuff {
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
   * 材料名称
   */

  String stuffName;

  /**
   * 材料类型
   */

  String stuffType;

  /**
   * 材料必要性
   */

  String isNeed;

  /**
   * 关联stuffCatalog表ID
   */

  int stuffCatalogId;

  /**
   * 材料样本
   */

  String sampleTable;

  /**
   * 来源渠道
   */

  String source;

  /**
   * 填报须知
   */

  String notice;

  /**
   * 受理标准
   */

  String acceptStandard;

  /**
   * 设定依据
   */

  String byLaw;

  /**
   * 排序
   */

  int orderNum;

  /**
   * 纸质材料份数
   */

  int pageNum;

  /**
   * 纸质材料规格
   */

  String pageFormat;

  /**
   * 材料形式
   */

  String materialFormat;

  /**
   * 纸质材料类型
   */

  String paperMaterialType;

  /**
   * 原件份数
   */

  int masterNum;

  /**
   * 复印件份数
   */

  int copyNum;

  /**
   * 交换的材料标志
   */

  String materialGuid;

  /**
   * 电子表单
   */

  String elecForm;

  /**
   * 是否推送
   */

  String isPush;

  /****************以上主要为系统表字段********************/

  String isCheck;

  int stuffRelationId;

  int stuffRegisterId;

  String fileIds;

  String stuffFileNum;

  int postilNum;

  String itemNo;

  List<Upfiles> listUpFiles ;

  /**
   * 办理项目附件批注
   */
  List<Postil> listPostil ;

  /**
   * 网上预审的时候提交的申报材料，在网上预审受理的时候使用
   */
  String applyFiles;

  /**
   * 登记的时候提交的申报材料，在登记受理的时候使用
   */
  String registerFiles;

  /**
   * 必应绑定的并联审批事项的id
   */
  int uniteItemStuffId;

/****************以上为自己添加字段********************/


  ItemStuff(this.id, this.recordCreateTime, this.itemId, this.uniteItemId,
      this.stuffName, this.stuffType, this.isNeed, this.stuffCatalogId,
      this.sampleTable, this.source, this.notice, this.acceptStandard,
      this.byLaw, this.orderNum, this.pageNum, this.pageFormat,
      this.materialFormat, this.paperMaterialType, this.masterNum, this.copyNum,
      this.materialGuid, this.elecForm, this.isPush, this.isCheck,
      this.stuffRelationId, this.stuffRegisterId, this.fileIds,
      this.stuffFileNum, this.postilNum, this.itemNo, this.listUpFiles,
      this.listPostil, this.applyFiles, this.registerFiles,
      this.uniteItemStuffId);

  factory ItemStuff.fromJson(Map<String, dynamic> srcJson) =>
      _$ItemStuffFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemStuffToJson(this);
}
