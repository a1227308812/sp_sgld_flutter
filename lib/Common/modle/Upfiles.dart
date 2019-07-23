import 'package:json_annotation/json_annotation.dart';

part 'Upfiles.g.dart';

@JsonSerializable()
class Upfiles {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 附件后缀
   */

  String fileExt;

  /**
   * 文件名
   */

  String filename;

  /**
   * 保存路径
   */

  String filepath;

  /**
   * 文件大小(字节)
   */

  int sizeb;

  /**
   * 文件大小(G、M、K)
   */

  String sizem;

  /**
   * uuid
   */

  String uuid;

  /**
   * 如果是图片 存入图片宽度
   */

  int picWidth;

  /**
   * 如果是图片 存入图片长度
   */

  int picHeight;

  /**
   * 材料Id
   */

  int stuffId;

  /****************以上主要为系统表字段********************/

  /****************以上为自己添加字段********************/

  Upfiles(
      this.id,
      this.recordCreateTime,
      this.fileExt,
      this.filename,
      this.filepath,
      this.sizeb,
      this.sizem,
      this.uuid,
      this.picWidth,
      this.picHeight,
      this.stuffId);

  factory Upfiles.fromJson(Map<String, dynamic> srcJson) =>
      _$UpfilesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UpfilesToJson(this);
}
