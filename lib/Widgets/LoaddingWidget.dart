import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/**
 * Created by ZWP on 2019/7/18 11:03.
 * 描述：统一数据加载控件（非列表页面）
 */
class LoaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoaddingStateful();
  }
}

class LoaddingStateful extends StatefulWidget {
  @override
  State<LoaddingStateful> createState() {
    // TODO: implement createState
    return LoaddingState();
  }
}

class LoaddingState extends State<LoaddingStateful> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
//        height: double.infinity,
//        width: double.infinity,
//        color: Color(0x88000000),
        //一圈小球球不同的转动
        child: SpinKitCircle(
          //转一圈的时间
          duration: Duration(milliseconds: 1000),
          //每个小球球的大小
          size: 100,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                //int的isEven和isOdd是奇数偶数判断  isOdd奇数  isEvent偶数
                color: index.isEven ? Colors.red : Colors.green,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}
