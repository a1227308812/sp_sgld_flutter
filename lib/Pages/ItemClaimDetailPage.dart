import 'package:flutter/gestures.dart';
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
 * Created by ZWP on 2019/7/5 16:03.
 * 描述：事项认领详情界面
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
        title: Text('事项详情'),
        centerTitle: true,
      ),
      extendBody: true,
      body: TabBar(tabs: [
        Text('详细信息'),
        Text('')
      ]),
    );
  }


}
