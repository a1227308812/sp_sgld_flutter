import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:flutter/cupertino.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/modle/ItemClaim.dart';
import 'package:sp_sgld_flutter/Common/modle/PageResult.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorageKey.dart';

/**
 * Created by ZWP on 2019/8/06 10:20.
 * 描述：执法认领列表界面
 */
class PatrolClaimListPage extends StatefulWidget {
  @override
  State<PatrolClaimListPage> createState() {
    return _PatrolClaimListPageState();
  }
}

class _PatrolClaimListPageState extends State<PatrolClaimListPage> {
  static int pageNum = 0;
  List<Patrol> patrolList = List();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey<EasyRefreshState>();
  bool hasNextPage = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f9),
      appBar: AppBar(
        title: Text('列表'),
        centerTitle: true,
      ),
      body: InfiniteListView(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(20),
            bottom: ScreenUtil().setHeight(20)),
        easyRefreshKey: easyRefreshKey,
        data: patrolList,
        firstRefresh: true,
        hasNextPage: hasNextPage,
        refreshCallback: () {
          print('refreshCallback');
          getSeverceData(true);
        },
        loadMoreCallBack: () {
          print('loadMoreCallBack');
          if (hasNextPage) getSeverceData(false);
        },
        itemBuilder: (BuildContext context, int index) {
          return _getItemLayout(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: ScreenUtil().setHeight(18),
          );
        },
      ),
    );
  }

  //获取网络数据
  void getSeverceData(bool isRefresh) async {
    if (isRefresh) {
      pageNum = 0;
      hasNextPage = true;
    }
    // 获取登录人员id
    String userJson =
        (await LocalStorage.getString(LocalStorageKey.user)) ?? "";
    UserInfo userInfo = UserInfo.fromJson(json.decode(userJson));
    var userId = userInfo?.id;
    Map parms = {
      'userId': userId,
      'pageSize': Config.pageSize,
      'pageNum': pageNum
    };
    ResultData resultData = await BasicNetService()
        .post(Api.listPagedPatrolForZFClaim, params: parms);
    if (resultData.resultStatue) {
      PageResult pageResult = PageResult.fromJson(resultData.data);
      if (isRefresh) patrolList.clear();
      patrolList.addAll(
          pageResult.listData.map((map) => Patrol.fromJson(map)).toList());
      if (pageResult.listData?.length < Config.pageSize) hasNextPage = false;
      setState(() {
        pageNum++;
      });
    } else {
      showToast(resultData.data);
    }
  }

  //初始化item布局
  Widget _getItemLayout(int index) {
    EdgeInsetsGeometry hadButtom = EdgeInsets.only(
        top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(30));
    EdgeInsetsGeometry notButtom = EdgeInsets.only(
        top: ScreenUtil().setHeight(30),
        left: ScreenUtil().setWidth(30),
        right: ScreenUtil().setWidth(30));
    return GestureDetector(
      onTap: () {
//        showToast('跳转详情');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0x333f78b9), blurRadius: 1),
          ],
        ),
        constraints: BoxConstraints(minHeight: ScreenUtil().setHeight(153)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: patrolList[index].zfClaimState == 0
                              ? hadButtom
                              : notButtom,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                //认领状态 0未认领  1认领
                                text: patrolList[index].zfClaimState == 0
                                    ? '未认领'
                                    : '已认领',
                                style: TextStyle(
                                    color: Colors.white,
                                    background: Paint()
                                      ..style = PaintingStyle.fill
                                      ..color =
                                          patrolList[index].zfClaimState == 0
                                              ? Colors.red
                                              : Colors.green)),
                            TextSpan(
                              text:
                                  '  ' + patrolList[index].itemName.toString(),
                              style: TextStyle(
                                  color: Color(0xff373b40),
                                  fontSize: ScreenUtil().setSp(30)),
                            )
                          ])),
                        ),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(25),
                          bottom: ScreenUtil().setHeight(30),
                          left: ScreenUtil().setWidth(30)),
                      child: Text(
                        '申请人：' + patrolList[index].proposerName.toString(),
                        style: TextStyle(
                            color: Color(0xffa0a4a9),
                            fontSize: ScreenUtil().setSp(24)),
                      )),
                ],
              ),
            ),
            initReceiveButtom(index),
          ],
        ),
      ),
    );
  }

  initReceiveButtom(int index) {
    Widget receiveButton = GestureDetector(
      onTap: () {
        /**
         * 1、填充接收确认框
         * 2、确认接收之后刷新列表数据
         */
        showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('确认要接收吗？'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('取消'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('确认'),
                    onPressed: () {
                      //发送接收操作给后台，提示完成认领
                      _submitData(patrolList[index].id);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(30), left: ScreenUtil().setWidth(10)),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(88),
        height: ScreenUtil().setWidth(88),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xff78cefd),
          shadows: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 3)
          ],
        ),
        child: Text('接收',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(24))),
      ),
    );

    if (patrolList[index].zfClaimState == 0) {
      return receiveButton;
    } else {
      return Container();
    }
  }

  //提交认领信息
  void _submitData(int id) async {
    Map parms = {
      //事项id
      'id': id,
    };
    ResultData resultData =
        await BasicNetService().post(Api.doPatrolClaim, params: parms);
    if (resultData.resultStatue) {
      //刷新列表
      easyRefreshKey.currentState.callRefresh();
    } else {
      showToast(resultData.data);
    }
    Navigator.of(context).pop();
  }
}
