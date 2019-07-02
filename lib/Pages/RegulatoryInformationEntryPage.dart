import 'package:flutter/material.dart';
import 'package:sp_sgld_flutter/Widgets/InfiniteListView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_sgld_flutter/Common/config/Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';

/**
 * Created by ZWP on 2019/6/21 11:38.
 * 描述：监管信息录入列表界面
 */
class RegulatoryInformationEntryListPage extends StatefulWidget {
  @override
  State<RegulatoryInformationEntryListPage> createState() {
    // TODO: implement createState
    return RegulatoryInformationEntryState();
  }
}

class RegulatoryInformationEntryState
    extends State<RegulatoryInformationEntryListPage> {
  List data = List();
  GlobalKey<EasyRefreshState> easyRefreshKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('整改信息录入')),
      extendBody: true,
      body: InfiniteListView(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(20),
              bottom: ScreenUtil().setHeight(20)),
          data: data,
          easyRefreshKey: easyRefreshKey,
          firstRefresh: true,
          refreshCallback: () {
            print('refreshCallback');
            data.clear();
            for (var i = 0; i < 10; ++i) {
              data.add('刷新数据');
            }
            setState(() {});
          },
          loadMoreCallBack: () {
            print('loadMoreCallBack');
            data..add('加载的新增数据')..add('加载的新增数据')..add('加载的新增数据');
            setState(() {});
          },
          hasSeparator: true,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              color: Color(0xfff7f7f9),
              height: ScreenUtil().setHeight(20),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showToast('跳转详情');
              },
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color(0x333f78b9), blurRadius: 1),
                  ],
                ),
                constraints:
                    BoxConstraints(minHeight: ScreenUtil().setHeight(153)),
                child: Row(
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
//                              Container(
//                                alignment: Alignment.centerLeft,
//                                padding: EdgeInsets.only(
//                                    top: ScreenUtil().setHeight(7),
//                                    bottom: ScreenUtil().setHeight(7),
//                                    left: ScreenUtil().setWidth(12),
//                                    right: ScreenUtil().setWidth(12)),
//                                decoration: BoxDecoration(
//                                    color: Colors.red,
//                                    borderRadius:
//                                        BorderRadius.all(Radius.circular(3))),
//                                child: Text(
//                                  '未接收',
//                                  style: TextStyle(
//                                      color: Colors.white,
//                                      fontSize: ScreenUtil().setSp(22)),
//                                ),
//                              ),
                              Expanded(
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "未接收",
                                      style: TextStyle(
                                          color: Colors.white,
                                          background: Paint()
                                            ..style = PaintingStyle.fill
                                            ..color = Colors.red)),
                                  TextSpan(
                                    text: "  成都中医药大学智慧实验室采购申请",
                                    style: TextStyle(
                                        color: Color(0xff373b40),
                                        fontSize: ScreenUtil().setSp(30)),
                                  )
                                ])),
                              )
                            ],
                          ),
                          Text(
                            '申请人：刘成钢',
                            style: TextStyle(
                                color: Color(0xffa0a4a9),
                                fontSize: ScreenUtil().setSp(24)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: ScreenUtil().setWidth(88),
                      height: ScreenUtil().setWidth(88),
                      child: FloatingActionButton(
                        onPressed: () {
                          showToast('点击跳转详情');
                        },
                        backgroundColor: Color(0xff78cefd),
                        elevation: 3,
                        shape: CircleBorder(),
                        child: Text('录入',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(24))),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
