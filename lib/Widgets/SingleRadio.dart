import 'package:sp_sgld_flutter/Utils/ImportLib.dart';

/**
 * Created by ZWP on 2019/7/12 16:20.
 * 描述：单选按钮
 */
//
typedef void SelectRadio(int groupValue);

class SingleRadio extends StatefulWidget {
  //点击选择的id
  int groupValue = -1;

  //id
  int value = 0;

  //标题名称
  String title;

  SelectRadio selectRadio;

  SingleRadio({this.title, this.groupValue, this.value, this.selectRadio});

  @override
  State<SingleRadio> createState() {
    // TODO: implement createState
    return _initSingleRadioState();
  }
}

class _initSingleRadioState extends State<SingleRadio> {
  @override
  Widget build(BuildContext context) {
    print("_initSingleRadioState");
    // TODO: implement build
    return InkWell(
      onTap: () {
        if (widget.groupValue != widget.value)
          //修改被选中的值
          onChanged(widget.value);
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: double.infinity,
              alignment: AlignmentDirectional.center,
              width: ScreenUtil().setWidth(50),
              child: Radio<int>(
                groupValue: widget.groupValue,
                value: widget.value,
                onChanged: (int newValue) {},
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
          ],
        ),
      ),
    );
  }

//刷新状态
  void onChanged(value) {
    //赋值
    widget.groupValue = value;

    widget.selectRadio(value);
    //刷新状态
    setState(() {});
  }
}
