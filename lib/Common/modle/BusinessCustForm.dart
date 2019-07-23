import 'package:json_annotation/json_annotation.dart';

import 'ItemStuff.dart';

part 'BusinessCustForm.g.dart';

@JsonSerializable()
class BusinessCustForm {
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
   * 自定义表单ID
   */

  int custFormId;

  /**
   * 自定义表单名称
   */

  String custFormName;

  /**
   * 纸张方向0纵向1横向
   */

  String direction;

  /**
   * 纸张页数
   */

  String pageNum;

  /**
   * 背景图
   */

  String backImage;

  /**
   * 自定义表单实例后保存为xml格式
   */

  String custXml;

  /****************以上主要为系统表字段********************/

  /****************以上为自己添加字段********************/


  BusinessCustForm(this.id, this.recordCreateTime, this.businessId,
      this.custFormId, this.custFormName, this.direction, this.pageNum,
      this.backImage, this.custXml);

  factory BusinessCustForm.fromJson(Map<String, dynamic> srcJson) =>
      _$BusinessCustFormFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BusinessCustFormToJson(this);
}
