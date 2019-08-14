import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

import 'package:sp_sgld_flutter/Common/Http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/modle/PageResult.dart';
import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Common/modle/SuperBuspush.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';

import 'IntegratedQueryDetail.dart';

/**
 * Created by ZWP on 2019/7/19 16:41.
 * 描述：综合查询列表界面
 */
class IntegratedQueryListPage extends StatefulWidget {
  @override
  State<IntegratedQueryListPage> createState() {
    // TODO: implement createState
    return IntegratedQueryState();
  }
}

class IntegratedQueryState extends State<IntegratedQueryListPage> {
  List<InitDataModle> initDataModleList = List();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey();
  var hasNextPage = true;
  static var pageNum = 0;

  UserInfo userInfo;

  @override
  void initState() {
    super.initState();
    //获取登录账号信息
    Future(() async {
      String userJson =
          (await LocalStorage.getString(LocalStorageKey.user)) ?? "";
      UserInfo userInfo = UserInfo.fromJson(json.decode(userJson));
      return userInfo;
    }).then((UserInfo user) {
      print('then');
      this.userInfo = user;
    }).catchError((onError) {
      showToast(onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CostomWillPopScope(
      title: '综合查询',
      body: InfiniteListView(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
              bottom: ScreenUtil().setHeight(20)),
          data: initDataModleList,
          easyRefreshKey: easyRefreshKey,
          hasNextPage: hasNextPage,
          refreshCallback: () {
            if ('2' == userInfo.depType) {
              //监管者
              getSeverceDataByPatrol(true);
            } else if ('3' == userInfo.depType) {
              //执法者
              getSeverceDataByApparitor(true);
            }
          },
          loadMoreCallBack: () {
            if (hasNextPage) {
              if ('2' == userInfo.depType) {
                //监管者
                getSeverceDataByPatrol(false);
              } else if ('3' == userInfo.depType) {
                //执法者
                getSeverceDataByApparitor(false);
              }
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Color(0xfff7f7f9),
              height: ScreenUtil().setHeight(20),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return _getItemLayout(index);
          }),
    );
  }

  Widget _getItemLayout(int index) {
    return GestureDetector(
      onTap: () {
//        showToast('跳转详情');
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0x333f78b9), blurRadius: 1),
            ],
          ),
          constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(153)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(25)),
                color: Color(0xff4791e5),
                width: ScreenUtil().setWidth(7),
                height: ScreenUtil().setHeight(153),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      initDataModleList[index].proposerName,
                      style: TextStyle(
                        color: Color(0xff373b40),
                        fontSize: ScreenUtil().setSp(30),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                      child: Text(
                        initDataModleList[index].itemName,
                        style: TextStyle(
                          color: Color(0xffa0a4a9),
                          fontSize: ScreenUtil().setSp(30),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: !initDataModleList[index].hadDetail,
                child: GestureDetector(
                  onTap: () {
                    //跳转录入页面
                    NavigatorUtils.navigatorRouterByWidget(
                        context: context,
                        widget: IntegratedQueryDetail(
                            initDataModleList[index].id,
                            '2' == userInfo.depType
                                ? 0
                                : '3' == userInfo.depType ? 1 : 0));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(30),
                        left: ScreenUtil().setWidth(10)),
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(88),
                    height: ScreenUtil().setWidth(88),
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color(0xff78cefd),
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 3)
                      ],
                    ),
                    child: Text('查看',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(24))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //监管综合查询
  void getSeverceDataByPatrol(bool isRefresh) async {
    if (isRefresh) {
      pageNum = 0;
      hasNextPage = true;
    }
    // 获取登录人员id
    var userId = userInfo?.id;
    Map parms = {
      'userId': userId,
      'pageSize': Config.pageSize,
      'pageNum': pageNum
    };
    ResultData resultData =
        await BasicNetService().post(Api.querySupervise, params: parms);
    if (resultData.resultStatue) {
      PageResult result = PageResult.fromJson(resultData.data);
      if (null != result) {
        //取出数据集合
        List dataList = result.listData;
        //把每个集合元素转成对应的对象并装入集合中
        List<SuperBuspush> newData =
            dataList.map((map) => SuperBuspush.fromJson(map)).toList();

        if (isRefresh) initDataModleList.clear();
        //数据转换
        List<InitDataModle> transformList =
            newData.map((SuperBuspush superBuspush) {
          InitDataModle initDataModle = InitDataModle();
          initDataModle.id = superBuspush.patrolId ?? -1;
          initDataModle.proposerName = superBuspush.proposerName ?? '';
          initDataModle.itemName = '事项名称：' + superBuspush.itemName ?? '';
          initDataModle.hadDetail =
              superBuspush.patrolId == null ? false : true;
          return initDataModle;
//          Business business = superBuspush.busienss;
//          //初始化办件id
//          if (null != business) {
//            String serviceObject = business.serviceObject;
//            Proposer proposer = business.proposer;
//            if (null != proposer) {
//              //服务对象类型
//              //除了自然人，其他都按照企业执行
//              if (serviceObject == '1') {
//                initDataModle.proposerName = proposer.userName;
//                initDataModle.cardNum = '身份证号码：' + proposer.userCardNo;
//              } else {
//                initDataModle.proposerName = proposer.companyName;
//                initDataModle.cardNum = '证件号码：' + proposer.companyNo;
//              }
//            }
//          }
        }).toList();

        initDataModleList.addAll(transformList);
        if (transformList?.length < Config.pageSize) hasNextPage = false;
        setState(() {
          pageNum++;
        });
      }
    } else {
      showToast(resultData.data);
    }
  }

  //执法综合查询
  void getSeverceDataByApparitor(bool isRefresh) async {
    if (isRefresh) {
      pageNum = 0;
      hasNextPage = true;
    }
    // 获取登录人员id
    var userId = userInfo?.id;
    Map parms = {
      'userId': userId,
      'pageSize': Config.pageSize,
      'pageNum': pageNum
    };
    ResultData resultData =
        await BasicNetService().post(Api.queryApparitor, params: parms);
    if (resultData.resultStatue) {
      PageResult result = PageResult.fromJson(resultData.data);
      if (null != result) {
        //取出数据集合
        List dataList = result.listData;
        //把每个集合元素转成对应的对象并装入集合中
        List<Patrol> newData =
            dataList.map((map) => Patrol.fromJson(map)).toList();

        if (isRefresh) initDataModleList.clear();
        //数据转换
        List<InitDataModle> transformList = newData.map((Patrol patrol) {
          InitDataModle initDataModle = InitDataModle();
          initDataModle.id = patrol.apparitorId ?? -1;
          initDataModle.proposerName = patrol.proposerName ?? '';
          initDataModle.itemName = '事项名称：' + patrol.itemName ?? '';
          initDataModle.hadDetail = patrol.apparitorId == null ? false : true;
          return initDataModle;
//          Business business = patrol.business;
//          //初始化办件id
//          if (null != business) {
//            String serviceObject = business.serviceObject;
//            Proposer proposer = business.proposer;
//            if (null != proposer) {
//              //服务对象类型
//              //除了自然人，其他都按照企业执行
//              if (serviceObject == '1') {
//                initDataModle.proposerName = proposer.userName;
//                initDataModle.itemName = proposer.userCardNo;
//              } else {
//                initDataModle.proposerName = proposer.companyName;
//                initDataModle.itemName = proposer.companyNo;
//              }
//            }
//          }
        }).toList();

        initDataModleList.addAll(transformList);
        if (transformList?.length < Config.pageSize) hasNextPage = false;
        setState(() {
          pageNum++;
        });
      }
    } else {
      showToast(resultData.data);
    }
  }
}

class InitDataModle {
  int id; //如果是监管信息  id= SuperBuspush.patrolId  如果是执法信息 id=Patrol.apparitorId
  /*默认不可修改数据*/
  //被检查人姓名/企业名称
  var proposerName = '';

  //事项名称
  var itemName = '';

  //被检查人身份证号码/企业编号
  var cardNum = '';

  /**
   * 是否有详情信息
      如果是执法信息 就判断apparitorId是否为空，不为空表示有执法详情信息。
      如果是监管信息 就判断patrolId是否为空，不为空表示有执法详情信息。
   */
  bool hadDetail = false;
}
