import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ItemBaseInfo extends StatefulWidget {
  @override
  State<ItemBaseInfo> createState() {
    // TODO: implement createState
    return ItemBaseInfoState();
  }
}

class ItemBaseInfoState extends State<ItemBaseInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      dragStartBehavior: DragStartBehavior.start,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _getItemLayout('姓名', '张三'),
            _getItemLayout('手机号', '19328435555'),
            _getItemLayout('联系地址', '四川省成都市武侯区火炬时代'),
            _getItemLayout('日期', '2019/07/11'),
            _getItemLayout('时间', '10:30'),
          ],
        ),
      ),
    );
  }

  _getItemLayout(String title, String content) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
