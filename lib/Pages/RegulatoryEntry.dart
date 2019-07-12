import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:sp_sgld_flutter/Widgets/SingleRadio.dart';

/**
 * Created by ZWP on 2019/7/11 17:31.
 * 描述：录入详情页面
 */
class RegulatoryEntryPage extends StatefulWidget {
  @override
  State<RegulatoryEntryPage> createState() {
    // TODO: implement createState
    return _RegulatoryEntryState();
  }
}

class _RegulatoryEntryState extends State<RegulatoryEntryPage> {
  var name = '张三';
  var idCard = '511304xxxxxxxxxxxx';
  var date = '2019/07/11';
  var checkNum = '3';
  var checkResult = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_RegulatoryEntryState");
    return Scaffold(
      appBar: AppBar(
        title: Text('监管信息录入'),
        centerTitle: true,
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getInfoItem(title: '被检查人：', hint: '请输入被检查人姓名', content: name),
            _getInfoItem(title: '身份证号：', hint: '请输入身份证号码', content: idCard),
            _getJCRQItem(title: '检查日期：', hint: '请选择检查日期', content: date),
            _getJCCSItem(title: '检查次数：', hint: '请输入检查次数', content: checkNum),
            _getJCJGItem(title: '检查结果：', hint: '请输入检查次数', content: checkNum),
//            _getCLJGItem(title: '处理结果：', hint: '请选择处理结果', content: checkNum),
//            _getXCRYItem(title: '巡查人员：', hint: '请输入检查次数', content: checkNum),
//            _getZGDQRQItem(
//                title: '整改到期日期：', hint: '请输入检查次数', content: checkNum),
          ],
        ),
      ),
    );
  }

  _getInfoItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: '$content')),
                    decoration: InputDecoration(
                        hintText: '$hint', border: InputBorder.none),
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //检查日期
  _getJCRQItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then((selectDate) {
                        //设置选择的日期
                        print(selectDate.toIso8601String());
                        this.date =
                            '${selectDate.year}-${selectDate.month}-${selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Text(
                      '$content',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //检查次数
  _getJCCSItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: '本年度第$content次检查')),
                    decoration: InputDecoration(
                        hintText: '$hint', border: InputBorder.none),
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //检查结果
  _getJCJGItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: SingleRadio(
                          title: '符合',
                          groupValue: checkResult,
                          value: 0,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: SingleRadio(
                          title: '基本符合',
                          groupValue: checkResult,
                          value: 1,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: SingleRadio(
                          title: '不符合',
                          groupValue: checkResult,
                          value: 2,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //处理结果
  _getCLJGItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '*',
                  style:
                  TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: SingleRadio(
                          title: '符合',
                          groupValue: checkResult,
                          value: 0,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: SingleRadio(
                          title: '基本符合',
                          groupValue: checkResult,
                          value: 1,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Flexible(
                        child: SingleRadio(
                          title: '不符合',
                          groupValue: checkResult,
                          value: 2,
                          selectRadio: (value) {
                            checkResult = value;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //巡查人员
  _getXCRYItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    textAlign: TextAlign.right,
                    controller: TextEditingController.fromValue(
                        TextEditingValue(text: '本年度第$content次检查')),
                    decoration: InputDecoration(
                        hintText: '$hint', border: InputBorder.none),
                    style: TextStyle(decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  //整改到期日期
  _getZGDQRQItem(
      {String title, String hint, String content, bool isMandatory}) {
    return Container(
      height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  '*',
                  style:
                      TextStyle(color: isMandatory ? Colors.red : Colors.white),
                ),
                Text('$title'),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then((selectDate) {
                        //设置选择的日期
                        print(selectDate.toIso8601String());
                        this.date =
                            '${selectDate.year}-${selectDate.month}-${selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Text(
                      '$content',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
