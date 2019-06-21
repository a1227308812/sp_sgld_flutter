import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:async/async.dart';

/**
 * Created by ZWP on 2019/6/20 18:14.
 * 描述：事项认领界面
 */
class ItemCliamPage extends StatefulWidget {
  @override
  State<ItemCliamPage> createState() {
    // TODO: implement createState
    return _ItemCliamPageState();
  }
}

class ClaimInfo {
  String title;
  String depNum;

  ClaimInfo(this.title, this.depNum);
}

class _ItemCliamPageState extends State<ItemCliamPage> {
  List<ClaimInfo> ItemClaimInfo = List()
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'))
    ..add(ClaimInfo('成都建筑有限公司', '00524554845'));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff7f7f9),
      appBar: AppBar(
        title: Text('列表'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(20),
            bottom: ScreenUtil().setHeight(20)),
        itemCount: ItemClaimInfo.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: ScreenUtil().setHeight(18),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Center(
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
                          ItemClaimInfo[index].title,
                          style: TextStyle(
                            color: Color(0xff373b40),
                            fontSize: ScreenUtil().setSp(30),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                          child: Text(
                            '信用代码：' + ItemClaimInfo[index].depNum,
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
                      Container(
                        width: ScreenUtil().setWidth(88),
                        height: ScreenUtil().setWidth(88),
                        margin:
                            EdgeInsets.only(left: ScreenUtil().setWidth(15)),
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
                      Container(
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
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
