/**
 * Created by ZWP on 2019/7/1 15:28.
 * 描述：接口地址
 */
class Api {
//  // 加密密钥
//  static const secretKey = '610822-FUGU-SP-98-201902';

  // 服务器地址
  static const String baseUrl = "http://192.168.1.77:83";

  static const String appUrl = '/app/';

  // 上传附件
  static const String uploadFile = 'uploadFile';

  //登录 post
  static const String login = '/approvalManageApp/login';

  //获取APP菜单 post
  static const String listDataDic = '/approvalManageApp/listDataDic';

  //部门列表 post
  static const String listPagedDep = '/approvalManageApp/listPagedDep';

  //人员列表 post
  static const String listPagedUserInfo =
      '/approvalManageApp/listPagedUserInfo';

  //事项列表 post
  static const String listPagedItem = '/approvalManageApp/listPagedItem';

  //查询推送的监管办件列表 post
  static const String listPagedSuperBuspushForClaim =
      '/approvalManageApp/listPagedSuperBuspushForClaim';

  //监管认领页面 post
  static const String doSuperBusClaimPage =
      '/approvalManageApp/doSuperBusClaimPage';

  //查看认领信息 post
  static const String showSuperBusClaimPage =
      '/approvalManageApp/showSuperBusClaimPage';

  //认领 post
  static const String doSuperBusClaim = '/approvalManageApp/doSuperBusClaim';

  //协调建议列表 post
  static const String addWorkCoordinationPage =
      '/approvalManageApp/addWorkCoordinationPage';

  //增加协调建议 post
  static const String addWorkCoordination =
      '/approvalManageApp/addWorkCoordination';

  //回复协调建议页面 post
  static const String addReplyPage = '/approvalManageApp/addReplyPage';

  //分页查询监管录入列表 post
  static const String listPagedPatrol = '/approvalManageApp/listPagedPatrol';

  //查看监管信息 post
  static const String showPatrolPage = '/approvalManageApp/showPatrolPage';

  //录入（查询我认领的监管事项） post
  static const String listPagedMyClaim = '/approvalManageApp/listPagedMyClaim';

  //录入监管信息页面 post
  static const String addPatrolPage = '/approvalManageApp/addPatrolPage';

  //录入监管信息 post
  static const String addPatrol = '/approvalManageApp/addPatrol';

  //删除监管信息 post
  static const String delPatrol = '/approvalManageApp/delPatrol';

  //整改录入 post
  static const String listPagedMyReform =
      '/approvalManageApp/listPagedMyReform';

  //删除整改信息 post
  static const String delReform = '/approvalManageApp/delReform';

  //查看整改信息 post
  static const String showReform = '/approvalManageApp/showReform';

  //录入整改信息（页面） post
  static const String updateReformPage = '/approvalManageApp/updateReformPage';

  //录入整改信息 post
  static const String updateReform = '/approvalManageApp/updateReform';

  //综合查询监管信息 post
  static const String querySupervise = '/approvalManageApp/querySupervise';

  //查询推送的执法办件列表 post
  static const String listPagedPatrolForZFClaim =
      '/approvalManageApp/listPagedPatrolForZFClaim';

  //执法认领 post
  static const String doPatrolClaim = '/approvalManageApp/doPatrolClaim';

  //执法认领（页面） post
  static const String doPatrolZFClaimPage =
      '/approvalManageApp/doPatrolZFClaimPage';

  //查看推送内容 post
  static const String showPushContent = '/approvalManageApp/showPushContent';

  //分页查询执法记录 post
  static const String listPagedApparitor =
      '/approvalManageApp/listPagedApparitor';

  //查询我认领的执法事项 post
  static const String listPagedMyApparitorClaim =
      '/approvalManageApp/listPagedMyApparitorClaim';

  //录入执法信息页面 post
  static const String addApparitorPage = '/approvalManageApp/addApparitorPage';

  //录入执法信息 post
  static const String addApparitor = '/approvalManageApp/addApparitor';

  //查看执法信息 post
  static const String showApparitorPage =
      '/approvalManageApp/showApparitorPage';

  //综合查询执法信息 post
  static const String queryApparitor = '/approvalManageApp/queryApparitor';
}
