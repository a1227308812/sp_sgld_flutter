import 'package:sp_sgld_flutter/Common/event/PatrolListRefreshEvent.dart';
import 'package:sp_sgld_flutter/Common/modle/Apparitor.dart';
import 'package:sp_sgld_flutter/Common/modle/Patrol.dart';
import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:sp_sgld_flutter/Common/Http/BasicNetService.dart';
import 'package:sp_sgld_flutter/Common/http/Api.dart';
import 'package:sp_sgld_flutter/Common/local/LocalStorage.dart';
import 'package:sp_sgld_flutter/Common/modle/PageResult.dart';
import 'package:sp_sgld_flutter/Common/modle/UserInfo.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';

import 'PatrolEntryPage.dart';

/**
 * Created by ZWP on 2019/8/06 11:38.
 * 描述：执法信息录入列表界面
 */
class PatrolInformationEntryListPage extends StatefulWidget {
  @override
  State<PatrolInformationEntryListPage> createState() {
    return RegulatoryInformationEntryState();
  }
}

class RegulatoryInformationEntryState
    extends State<PatrolInformationEntryListPage> {
  List<Patrol> patrolList = List();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey();
  bool hasNextPage = true;
  static int pageNum = 0;

  @override
  void initState() {
    super.initState();
    EventHelper.eventBus.on<PatrolListRefreshEvent>().listen((event) {
      //详情页面提交成功数据之后返回列表页面刷新列表
      getSeverceData(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('监管信息')),
      extendBody: true,
      body: InfiniteListView(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
              bottom: ScreenUtil().setHeight(20)),
          data: patrolList,
          easyRefreshKey: easyRefreshKey,
          hasNextPage: hasNextPage,
          refreshCallback: () {
            print('refreshCallback');
            getSeverceData(true);
          },
          loadMoreCallBack: () {
            print('loadMoreCallBack');
            if (hasNextPage) getSeverceData(false);
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
                      //事项名称
                      patrolList[index].itemName.toString(),
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
                        '申请人/企业名称：' +
                            patrolList[index].proposerName.toString(),
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
              GestureDetector(
                onTap: () {
                  //跳转录入页面
                  NavigatorUtils.navigatorRouterByWidget(
                      context: context,
                      widget: PatrolEntryPage(patrolList[index].id));
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
                  child: Text('录入',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    ResultData resultData =
        await BasicNetService().post(Api.listPagedMyApparitorClaim, params: parms);
    if (resultData.resultStatue) {
      PageResult result = PageResult.fromJson(resultData.data);
      if (null != result) {
        //取出数据集合
        List dataList = result.listData;
        //把每个集合元素转成对应的对象并装入集合中
        List<Patrol> newData =
            dataList.map((map) => Patrol.fromJson(map)).toList();

        if (isRefresh) patrolList.clear();
        patrolList.addAll(newData);
        if (newData?.length < Config.pageSize) hasNextPage = false;
        setState(() {
          pageNum++;
        });
      }
    } else {
      showToast(resultData.data);
    }
  }
}
