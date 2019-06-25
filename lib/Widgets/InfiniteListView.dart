library infinitelistview;

export 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../CommonConfig.dart';

class InfiniteListView extends StatefulWidget {
  //数据源
  List data;

  //每页条数
  int pageSize;

  //是否还有下一页
  bool hasNextPage;

  //是否显示分割线
  bool hasSeparator;

  //是否开启控件初始化效果控件
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
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  //头部key
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();

  //底部key
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  //@required 表示必填
  InfiniteListView({
    @required this.data,
    this.pageSize: 15,
    this.hasNextPage: true,
    this.hasSeparator: false,
    this.firstRefresh: true,
    this.itemBuilder,
    this.separatorBuilder,
    this.firstRefreshWidget,
    this.refreshCallback,
    this.loadMoreCallBack,
  });

  @override
  State<InfiniteListView> createState() {
    // TODO: implement createState
    return InfiniteListState();
  }
}

class InfiniteListState extends State<InfiniteListView> {
  // TODO: implement build
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');

    var listWidget = EasyRefresh(
      key: widget._easyRefreshKey,
      refreshHeader: BallPulseHeader(key: widget._headerKey),
      refreshFooter: BallPulseFooter(key: widget._footerKey),
      child: ListView.separated(
          itemBuilder: widget.itemBuilder,
          separatorBuilder: widget.separatorBuilder != null
              ? widget.hasSeparator
                  ? widget.separatorBuilder
                  : (BuildContext context, int index) {
                      return Container(
                        color: Colors.transparent,
                        height: 0,
                      );
                    }
              : (BuildContext context, int index) {
                  return Container(
                    color: Colors.transparent,
                    height: 0,
                  );
                },
          itemCount: widget.data.length),
      onRefresh: widget.refreshCallback,
      loadMore: widget.loadMoreCallBack,
      firstRefresh: widget.firstRefresh,
      //第一次进入是的加载效果控件
      firstRefreshWidget:
          widget.firstRefresh ? widget.firstRefreshWidget : null,
    );
    return listWidget;
  }
}
