import 'package:sp_sgld_flutter/Utils/ImportLib.dart';
import 'package:sp_sgld_flutter/Widgets/LoaddingWidget.dart';

class LoaddingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    //创建透明层
    return GestureDetector(
      onTap: () {
        //贱贱屏幕关闭dialog
//        Navigator.pop(context);
      },
      child: Material(
        type: MaterialType.transparency,
        child: LoaddingWidget(),
      ),
    );
  }
}
