library infinitelistview;

export 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:sp_sgld_flutter/Common/config/Config.dart';
/**
 * Created by ZWP on 2019/7/29 17:38.
 * 描述：自定义刷新列表
 */
class InfiniteListView extends StatefulWidget {
  EdgeInsetsGeometry padding;

  //数据源
  List data;

  //每页条数  默认15
  int pageSize;

  //是否还有下一页  默认true
  bool hasNextPage;

//  //是否显示分割线 默认false
//  bool hasSeparator;

  //是否开启控件第一次进入就触发刷新 默认true
  bool firstRefresh;

  //初始化显示控件
  Widget firstRefreshWidget;

  //item布局控件
  IndexedWidgetBuilder itemBuilder;

  //刷新回调
  RefreshCallback refreshCallback;

  //加载更多回调
  RefreshCallback loadMoreCallBack;

  //分割线控件
  IndexedWidgetBuilder separatorBuilder;

  //刷新控件的key
  GlobalKey<EasyRefreshState> easyRefreshKey;

  //@required 表示必填
  InfiniteListView({
    @required this.data,
    @required this.easyRefreshKey,
    this.pageSize: Config.pageSize,
    this.hasNextPage: true,
//    this.hasSeparator: true,
    this.firstRefresh: true,
    @required this.itemBuilder,
    this.separatorBuilder,
    this.firstRefreshWidget,
    this.refreshCallback,
    this.loadMoreCallBack,
    this.padding,
  });

  @override
  State<InfiniteListView> createState() {
    return InfiniteListState();
  }
}

class InfiniteListState extends State<InfiniteListView> {
  //头部key
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();

  //底部key
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget listWidget = EasyRefresh(
      key: widget.easyRefreshKey,
      emptyWidget: _getEmptyWidget(),
      refreshHeader: BallPulseHeader(key: _headerKey),
      refreshFooter: BallPulseFooter(key: _footerKey),
      child: ListView.separated(
          padding: widget.padding,
          itemBuilder: widget.itemBuilder,
          separatorBuilder: widget.separatorBuilder != null
              ? widget.separatorBuilder
              : (BuildContext context, int index) {
                  return Container(
                    color: Colors.transparent,
                    height: 0,
                  );
                },
          itemCount: widget.data.length),
      onRefresh: widget.refreshCallback,
      loadMore: widget.loadMoreCallBack,
//      onRefresh: () async {
//        widget.refreshCallback();
//      },
//      loadMore: () async {
//        widget.loadMoreCallBack();
//      },
      firstRefresh: widget.firstRefresh,
      //第一次进入是的加载效果控件
      firstRefreshWidget: widget.firstRefresh
          ? widget.firstRefreshWidget == null
              ? _getFirstRefreshWidget()
              : widget.firstRefreshWidget
          : null,
    );
    return listWidget;
  }

  //设置默认的加载widget
  _getFirstRefreshWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: Center(
          child: Container(
        color: Color(0xffd9d9d9),
        width: ScreenUtil().setWidth(750),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              child: SpinKitCubeGrid(
                color: Theme.of(context).primaryColor,
                size: 70.0,
              ),
            ),
            Container(
              child: Text(
                "数据加载中...",
                style: Config.textStyleDef,
              ),
            )
          ],
        ),
      )),
    );
  }

  //设置默认空布局
  _getEmptyWidget() {
    return Container();
  }
}
