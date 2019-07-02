import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/http/BasicNetService.dart';
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

class ClaimInfo {
  String title;
  String depNum;

  ClaimInfo(this.title, this.depNum);
}

class _ItemCliamListPageState extends State<ItemCliamListPage> {
  static int pageNum = 0;
  List<ClaimInfo> itemClaimInfo = List();
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
        hasSeparator: true,
        firstRefresh: true,
        hasNextPage: hasNextPage,
        refreshCallback: () async {
          print('refreshCallback');
          await getSeverceData();
          pageNum = 0;
          itemClaimInfo.clear();
          //初始化数据
          itemClaimInfo
            ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
            ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
            ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
            ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
            ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'));
          setState(() {});
        },
        loadMoreCallBack: () {
          print('loadMoreCallBack');
          pageNum++;
          if (hasNextPage) {
            //初始化数据
            itemClaimInfo
              ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
              ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
              ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'))
              ..add(ClaimInfo('成都建筑有限公司' + pageNum.toString(), '00524554845'));
            setState(() {
              if (pageNum >= 2) {
                print('setState');
                hasNextPage = false;
              }
            });
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showToast('跳转详情');
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color(0x333f78b9), blurRadius: 1),
                  ],
                ),
                constraints:
                    BoxConstraints(minHeight: ScreenUtil().setHeight(153)),
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
                            itemClaimInfo[index].title,
                            style: TextStyle(
                              color: Color(0xff373b40),
                              fontSize: ScreenUtil().setSp(30),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(25)),
                            child: Text(
                              '信用代码：' + itemClaimInfo[index].depNum,
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
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showToast('录入');
                          },
                          child: InkWell(
                            child: Container(
                              width: ScreenUtil().setWidth(88),
                              height: ScreenUtil().setWidth(88),
                              margin: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(15)),
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color(0xff78cefd),
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0),
                                        blurRadius: 2.0)
                                  ]),
                              child: Text(
                                '录入',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(24)),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showToast('修改');
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(88),
                            height: ScreenUtil().setWidth(88),
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(11),
                                right: ScreenUtil().setWidth(31)),
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Color(0xff62e5e5),
                                shadows: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 0),
                                      blurRadius: 2.0)
                                ]),
                            child: Text(
                              '修改',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(24)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: ScreenUtil().setHeight(18),
          );
        },
      ),
    );
  }

  void getSeverceData() async {
    //todo 获取登录人员id
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
    print(resultData);
  }
}
