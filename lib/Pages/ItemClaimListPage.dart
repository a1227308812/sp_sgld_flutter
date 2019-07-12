import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/modle/ItemClaim.dart';
import 'package:sp_sgld_flutter/Common/modle/PageResult.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorageKey.dart';
import 'dart:convert';
import 'package:sp_sgld_flutter/Common/config/Config.dart';

/**
 * Created by ZWP on 2019/6/20 18:14.
 * 描述：事项认领列表界面
 */
class ItemCliamListPage extends StatefulWidget {
  @override
  State<ItemCliamListPage> createState() {
    // TODO: implement createState
    return _ItemCliamListPageState();
  }
}

class _ItemCliamListPageState extends State<ItemCliamListPage> {
  static int pageNum = 0;
  List<ItemClaim> itemClaimInfo = List();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey<EasyRefreshState>();
  bool hasNextPage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        data: itemClaimInfo,
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
        .post(Api.listPagedSuperBuspushForClaim, params: parms);
    if (resultData.resultStatue) {
      PageResult pageResult = PageResult.fromJson(resultData.data);
      if (isRefresh) itemClaimInfo.clear();
      itemClaimInfo.addAll(
          pageResult.listData.map((map) => ItemClaim.fromJson(map)).toList());
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
                          margin: itemClaimInfo[index].claimState == 0
                              ? hadButtom
                              : notButtom,
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                //认领状态 0未认领  1认领
                                text: itemClaimInfo[index].claimState == 0
                                    ? '未认领'
                                    : '已认领',
                                style: TextStyle(
                                    color: Colors.white,
                                    background: Paint()
                                      ..style = PaintingStyle.fill
                                      ..color =
                                          itemClaimInfo[index].claimState == 0
                                              ? Colors.red
                                              : Colors.green)),
                            TextSpan(
                              text: '  ' +
                                  itemClaimInfo[index].itemName.toString(),
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
                        '申请人：' + itemClaimInfo[index].proposerName.toString(),
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
    Widget receiveButton = Container(
      margin: EdgeInsets.only(
          right: ScreenUtil().setWidth(30), left: ScreenUtil().setWidth(10)),
      color: Colors.white,
      width: ScreenUtil().setWidth(88),
      height: ScreenUtil().setWidth(88),
      child: FloatingActionButton(
        onPressed: () {
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
                        _submitData(itemClaimInfo[index].id);
                      },
                    ),
                  ],
                );
              });
        },
        backgroundColor: Color(0xff78cefd),
        elevation: 3,
        shape: CircleBorder(),
        child: Text('接收',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(24))),
      ),
    );

    if (itemClaimInfo[index].claimState == 0) {
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
        await BasicNetService().post(Api.doSuperBusClaim, params: parms);
    if (resultData.resultStatue) {
      //刷新列表
      easyRefreshKey.currentState.callRefresh();
    } else {
      showToast(resultData.data);
    }
    Navigator.of(context).pop();
  }
}
