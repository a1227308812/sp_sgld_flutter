import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  List data;

  InfiniteListView(this.data);

  @override
  State<InfiniteListView> createState() {
    // TODO: implement createState
    return InfiniteListState(data ?? List());
  }
}

class InfiniteListState extends State<InfiniteListView> {
  List data;
  int pageNum = 15;

  InfiniteListState(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.blue,
          height: 4,
        );
      },
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Widget itemLayout = Container(
          color: Colors.grey,
          height: 100,
        );
        //还有更多数据，需要加载更多数据
        if (data.length == pageNum) {

        }else{

        }

        return itemLayout;
      },
    );
  }
}
