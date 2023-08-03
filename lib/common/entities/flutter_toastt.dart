import 'package:e_learning/pages/export.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastInfo {
  showToast(
      {required String message,
      Color bacgroundColors = Colors.black,
      Color textColors = Colors.white}) {
    return Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        fontSize: 16.sp,
        backgroundColor: bacgroundColors,
        textColor: textColors);
  }
}
