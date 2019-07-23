import 'package:json_annotation/json_annotation.dart';

import 'Postil.dart';
import 'Upfiles.dart';

part 'StuffRelation.g.dart';

@JsonSerializable()
class StuffRelation{
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
   * 并联审批登记表id
   */
  
   int uniteRegisterId;

  /**
   * 附件Id
   */
  
   String fileIds;

  /****************以上主要为系统表字段********************/

   List<Upfiles> listUpFiles;

  /**
   * 这2个字段用于在保存附件的时候更新人员企业材料库
   */
   String cardNo;

   String companyNo;

  /**
   * 批注
   */
   List<Postil> listPostil;

  /**
   * 附件上传人id,在办件过程中记录给申请人上传电子材料的人员ID
   */
   int userId;

  /**
   * 人员库ID
   */
   int pid;

  /**
   * 人员材料库ID
   */
   int personStuffid;

  /**
   * 企业库
   */
   int cid;

  /**
   * 企业材料库ID
   */
   int companyStuffid;

  /****************以上为自己添加字段********************/


   StuffRelation(this.id, this.recordCreateTime, this.stuffId, this.businessId,
       this.uniteRegisterId, this.fileIds, this.listUpFiles, this.cardNo,
       this.companyNo, this.listPostil, this.userId, this.pid,
       this.personStuffid, this.cid, this.companyStuffid);

   factory StuffRelation.fromJson(Map<String, dynamic> srcJson) =>
      _$StuffRelationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StuffRelationToJson(this);
}