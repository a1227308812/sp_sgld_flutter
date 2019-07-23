import 'package:json_annotation/json_annotation.dart';

part 'Licence.g.dart';

@JsonSerializable()
class Licence {
  /**
   * id主键
   */
  int id;

  /**
   * 记录创建时间
   */
  String recordCreateTime;

  /**
   * 所属证照目录ID
   */

  int licenceCatalogId;

  /**
   * 证照所属区划
   */

  int regId;

  /**
   * 证照所属部门
   */

  int depId;

  /**
   * 模板名称
   */

  String modelName;

  /**
   * 模板Id
   */

  int /**
       * 证照模板ID
       */
      modelId;

  /**
   * 模板宽px
   */

  String modelWidth;

  /**
   * 模板高px
   */

  String modelHeight;

  /**
   * 背景图
   */

  int backImage;

  /**
   * 证照编码
   */

  String licenceNo;

  /**
   * 证照有效期
   */

  String usefulDate;

  /**
   * 文本实例数据
   */

  String textJson;

  /**
   * 变量实例数据
   */

  String fieldJson;

  /**
   * 二维码实例数据
   */

  String qrJson;

  /**
   * 图片实例数据
   */

  String imgJson;

  /**
   * 证照等级，参考字典表licenceLevel
   */

  String licenceLevel;

  /**
   * 持证者类型,参考字典表holderType
   */

  String holderType;

  /**
   * 持证者身份证号码
   */

  String holderCardNo;

  /**
   * 持证企业信用代码
   */

  String holderCompanyNo;

  /**
   * 状态参考字典表licenceState
   */

  String state;

  /**
   * 版本号
   */

  String version;

  /**
   * 是否已经生成证照0否1是
   */

  String hasCreate;

  /**
   * 证照水印内容
   */

  String waterContent;

  /**
   * 生成的图片证照
   */

  String imageId;

  /**
   * 生成的PDF证照
   */

  String pdfId;

  /**
   * 是否加盖了电子印章0否1是
   */

  String hasSign;

  /**
   * 证照是否可用0否1是
   */

  String enabled;

  /**
   * 签章实例数据
   */

  String signatureJson;

  /**
   * 证照状态 1新增 2变更 3年检 4注销 5挂失
   */

  String licenceStatus;

  /**
   * 审核的类型
   */

  String checkType;

  /**
   * 年检实例数据
   */

  String ycInfoJson;

  /**
   * 颁证日期
   */

  String issueDate;

  /**
   * 有效期止
   */

  String useStopDate;

  /**
   * 证照对应办件id
   */

  int businessId;

  /**
   * 证照对应catalogHolder的Id
   */

  int catalogHolderId;

  /****************以上主要为系统表字段********************/

//  /**
//   * 实例后的模板变量
//   */
//  List<RunModelField> listRunFiled;
//
//  /**
//   * 实例后的文本
//   */
//  List<RunModelText> listRunText;
//
//  /**
//   * 实例后的二维码
//   */
//  List<RunModelQrcode> listQrcode;
//
//  /**
//   * 实例后的图片
//   */
//  List<RunModelImg> listImg;
//
//  /**
//   * 实例后的签章
//   */
//  List<RunModelSignature> listSignature;
//
//  /**
//   * 实例后的年检信息
//   */
//  List<RunModelYcInfo> listYcInfo;

  /**
   * 目录名称
   */
  String catalogName;

  /**
   * 背景图片uuid
   */
  String uuid;

  /**
   * 背景图片文件名称
   */
  String fileName;

  /**
   * 背景图地址
   */
  String filepath;

//  /**
//   * 证照审核日志
//   */
//  List<LicenceVerifyLog> listVerifyLog;
//
//  /**
//   * 证照调用记录
//   */
//  List<LicenceUselog> listUselog;

  /**
   * 证照调用次数
   */
  int useCount;

  /**
   * 证照所属部门名称
   */
  String depName;

  /**
   * 持证人
   */
  String holderName;

  /**
   * 证照所属区划名称
   */
  String regName;

  /**
   * 查询条数
   */
  int unm;

  /**
   * 证照状态 1新增 2变更 3年检 4注销
   */
  String licenceState;

  /**
   * 年审周期
   */
  String yearCheck;

  /**
   * pdf路径
   */
  String pdfPath;

  /**
   * pdf的uuid
   */
  String pdfUuid;

  /**
   * pdf文件名
   */
  String pdfFileName;

  /**
   * 图像uuid
   */
  String imgUuid;

  /**
   * 图像文件名
   */
  String imgFileName;

  Licence(
      this.id,
      this.recordCreateTime,
      this.licenceCatalogId,
      this.regId,
      this.depId,
      this.modelName,
      this.modelId,
      this.modelWidth,
      this.modelHeight,
      this.backImage,
      this.licenceNo,
      this.usefulDate,
      this.textJson,
      this.fieldJson,
      this.qrJson,
      this.imgJson,
      this.licenceLevel,
      this.holderType,
      this.holderCardNo,
      this.holderCompanyNo,
      this.state,
      this.version,
      this.hasCreate,
      this.waterContent,
      this.imageId,
      this.pdfId,
      this.hasSign,
      this.enabled,
      this.signatureJson,
      this.licenceStatus,
      this.checkType,
      this.ycInfoJson,
      this.issueDate,
      this.useStopDate,
      this.businessId,
      this.catalogHolderId,
      this.catalogName,
      this.uuid,
      this.fileName,
      this.filepath,
      this.useCount,
      this.depName,
      this.holderName,
      this.regName,
      this.unm,
      this.licenceState,
      this.yearCheck,
      this.pdfPath,
      this.pdfUuid,
      this.pdfFileName,
      this.imgUuid,
      this.imgFileName);

  /****************以上为自己添加字段********************/

  factory Licence.fromJson(Map<String, dynamic> srcJson) =>
      _$LicenceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LicenceToJson(this);
}
