import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:sp_sgld_flutter/Widgets/CustomBorder.dart';
import 'package:sp_sgld_flutter/Widgets/SingleRadio.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';

/**
 * Created by ZWP on 2019/7/11 17:31.
 * 描述：录入详情页面
 */
class RegulatoryEntryPage extends StatefulWidget {
  //左边距
  static dynamic itemMaginLeft = ScreenUtil().setHeight(25);

  //item高度
  static dynamic itemHeight = ScreenUtil().setHeight(100);

  static var checkResultUpfileTitle = '检查结果记录表';
  static var otherUpfileTitle = '其他附件';

  @override
  State<RegulatoryEntryPage> createState() {
    print('RegulatoryEntryPage createState');
    // TODO: implement createState
    return _RegulatoryEntryState();
  }
}

class _RegulatoryEntryState extends State<RegulatoryEntryPage> {
  var name = '张三';
  var idCard = '511304xxxxxxxxxxxx';

  //选择的检查日期
  var checkDate = '2019/07/11';

  //选择的期限整改日期
  var treatmentDate = '2019/07/11';

  //检查次数
  var checkNum = '3';

  //检查结果
  var checkResult = 0;

  //处理结果
  var treatmentResult = 0;

  //检查结果附件
  List<Asset> checkUpfileList = List();

  //其他附件
  List<Asset> otherUpfileList = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("_RegulatoryEntryState build");
    return Scaffold(
      appBar: AppBar(
        title: Text('监管信息录入'),
        centerTitle: true,
      ),
      extendBody: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(onPressed: () {
                  //todo 关闭页面
                }, child: Text('取消'))),
            Container(
              color: Colors.grey,
              height: double.infinity,
              width: 1,
            ),
            Flexible(
                fit: FlexFit.tight,
                child: FlatButton(onPressed: () {
                  //todo 提交录入数据
                }, child: Text('提交'))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //分割区域
            spaceWidget(),
            _getInfoItem(title: '被检查人：', hint: '请输入被检查人姓名', content: name),
            _getInfoItem(title: '身份证号：', hint: '请输入身份证号码', content: idCard),
            _getJCRQItem(title: '检查日期：', hint: '请选择检查日期', content: checkDate),
            _getJCCSItem(title: '检查次数：', hint: '请输入检查次数', content: checkNum),
            _getJCJGItem(title: '检查结果：', hint: '请输入检查次数', content: checkNum),
            _getCLJGItem(title: '处理结果：', hint: '请选择处理结果', content: checkNum),
            _getXCRYItem(title: '巡查人员：', hint: '请输入巡查人员名称', content: checkNum),
            //只有选择的期限整改才会有整改到期日期选择
            treatmentResult == 1
                ? _getZGDQRQItem(
                    title: '整改到期日期：', hint: '请输入检查次数', content: treatmentDate)
                : Center(),
            //分割区域
            spaceWidget(),
            //检查结果附件
            buildJCJGJLBLayout(checkUpfileList),
            //其他附件
            buildotherUpfileLayout(otherUpfileList),
            //分割区域
            spaceWidget(),
          ],
        ),
      ),
    );
  }

  _getInfoItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: TextField(
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: '$content')),
                      decoration: InputDecoration(
                          hintText: '$hint', border: InputBorder.none),
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

  //检查日期
  _getJCRQItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                buildTipView(isMandatory),
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
                        this.checkDate =
                            '${selectDate.year}-${selectDate.month}-${selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: RegulatoryEntryPage.itemMaginLeft),
                      child: Text(
                        '$content',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
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
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: TextField(
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: '本年度第$content次检查')),
                      decoration: InputDecoration(
                          hintText: '$hint', border: InputBorder.none),
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

  //检查结果
  _getJCJGItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        right: RegulatoryEntryPage.itemMaginLeft),
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
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: SingleRadio(
                            title: '通过',
                            groupValue: treatmentResult,
                            value: 0,
                            selectRadio: (value) {
                              treatmentResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '期限整改',
                            groupValue: treatmentResult,
                            value: 1,
                            selectRadio: (value) {
                              treatmentResult = value;
                              // todo 显示整改期限
                              setState(() {});
                            },
                          ),
                        ),
                        Flexible(
                          child: SingleRadio(
                            title: '移交执法',
                            groupValue: treatmentResult,
                            value: 2,
                            selectRadio: (value) {
                              treatmentResult = value;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
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
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTipView(isMandatory),
                Text('$title'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(10),
                        right: RegulatoryEntryPage.itemMaginLeft),
                    child: TextField(
                      maxLines: 1,
                      textAlign: TextAlign.right,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: '$content')),
                      decoration: InputDecoration(
                          hintText: '$hint', border: InputBorder.none),
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
          ),
//          Divider(
//            height: 1,
//            color: Colors.grey,
//          )
        ],
      ),
    );
  }

  //整改到期日期
  _getZGDQRQItem(
      {String title, String hint, String content, bool isMandatory = true}) {
    return Container(
      height: RegulatoryEntryPage.itemHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                buildTipView(isMandatory),
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
                        this.treatmentDate =
                            '${selectDate.year}-${selectDate.month}-${selectDate.day}';
                        setState(() {});
                      }).catchError((error) {
                        print(error);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(20),
                          right: RegulatoryEntryPage.itemMaginLeft),
                      child: Text(
                        '$content',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(decoration: TextDecoration.none),
                      ),
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

  //分割线
  spaceWidget() {
    return Container(
      height: ScreenUtil().setHeight(24),
      color: Color(0xfff7f7f9),
    );
  }

  //检查结果附件上传
  buildJCJGJLBLayout(List itemList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        UpfileItemStateless(
            itemList, RegulatoryEntryPage.checkResultUpfileTitle),
      ],
    );
  }

  //其他附件
  buildotherUpfileLayout(List itemList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        UpfileItemStateless(itemList, RegulatoryEntryPage.otherUpfileTitle),
      ],
    );
  }

  buildTipView(bool isMandatory) {
    return Container(
      margin: EdgeInsets.only(left: RegulatoryEntryPage.itemMaginLeft),
      child: Text(
        '*',
        style: TextStyle(color: isMandatory ? Colors.red : Colors.white),
      ),
    );
  }
}

class UpfileItemStateless extends StatelessWidget {
  List list;

  //附件类型
  var type;

  UpfileItemStateless(this.list, this.type);

  @override
  Widget build(BuildContext context) {
    print('JCJGJLBItemState build');
    // TODO: implement build
    return UpfileItemStateful(list, type);
  }
}

class UpfileItemStateful extends StatefulWidget {
  List list;

  //附件类型
  var type;

  UpfileItemStateful(this.list, this.type);

  @override
  State<UpfileItemStateful> createState() {
    // TODO: implement createState
    return UpfileItemState();
  }
}

class UpfileItemState extends State<UpfileItemStateful> {
  //删除按钮的显示状态  默认不显示，长按附件item显示删除按钮
  bool showDelButton = false;

  @override
  Widget build(BuildContext context) {
    print('JCJGJLBItemState build');
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildItem(widget.list),
    );
  }

  buildItem(List<Asset> list) {
    List<Widget> widgetList = List();
    //标题
    widgetList.add(Container(
      margin: EdgeInsets.only(left: RegulatoryEntryPage.itemMaginLeft),
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(80),
      child: Text(widget.type),
    ));
    //分割线
    widgetList.add(Container(
      height: ScreenUtil().setHeight(1),
      color: Colors.grey,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
    ));
    //上传按钮
    widgetList.add(GestureDetector(
      onTap: () {
        //todo 选择图片或者文件或者拍照
        pickerImages(list);
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        width: double.infinity,
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30),
            top: ScreenUtil().setWidth(30),
            bottom: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            border:
                Border.all(width: ScreenUtil().setWidth(1), color: Colors.grey),
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10)))),
        alignment: Alignment.center,
        child: Text('上传'),
      ),
    ));
    //循环添加item
    for (int position = 0; position < list.length; position++) {
      Asset asset = list[position];
      Widget widget = Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                width: ScreenUtil().setWidth(40),
                height: ScreenUtil().setWidth(40),
                child: Text(
                  (position + 1).toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onLongPress: () {
                    //长按显示/隐藏所有item的删除按钮（打开/关闭删除功能），点击删除按钮删除对应控件和相关数据
                    showDelButton
                        ? showDelButton = false
                        : showDelButton = true;
                    setState(() {});
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(10),
                            right: ScreenUtil().setWidth(30)),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: ScreenUtil().setHeight(100),
                        child: Text(
                          '${asset.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      showDelButton
                          ? Positioned(
                              right: ScreenUtil().setWidth(30),
                              child: GestureDetector(
                                  onTap: () {
                                    print('删除');
                                    list.removeWhere((Asset checkAsset) =>
                                        checkAsset.name == asset.name);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.delete_forever)),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: ScreenUtil().setHeight(1),
            color: Colors.grey,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(30)),
          ),
        ],
      );
      widgetList.add(widget);
    }
    return widgetList;
  }

  //图片选择
  pickerImages(List<Asset> selectedAssetList) async {
    String error = '';
    try {
      await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: selectedAssetList,
        materialOptions: MaterialOptions(
          actionBarTitle: "",
          allViewTitle: "图片选择",
          actionBarColor: "#BBDEFB",
          actionBarTitleColor: "#ffffff",
          lightStatusBar: true,
          statusBarColor: '#BBDEFB',
          startInAllView: true,
          selectCircleStrokeColor: "#ffffff",
          selectionLimitReachedText: "你不能再选择更多图片了.",
        ),
      ).then((selectImgList) {
        widget.list = selectImgList;
        setState(() {});
      });
    } on PlatformException catch (e) {
      error = e.message;
      print(error);
    }
  }
}
