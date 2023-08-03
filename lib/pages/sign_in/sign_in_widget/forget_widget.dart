import '../../export.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 20.w, top: 10.h),
      child: Text(
        'Forget password',
        style: TextStyle(fontSize: 14.sp, decoration: TextDecoration.underline),
      ),
    );
  }
}
