import '../../export.dart';

class LogRegButton extends StatelessWidget {
  const LogRegButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  final String buttonName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        height: 60.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: buttonName == 'Register' ? Colors.black : Colors.blue),
            color: buttonName == 'Register' ? Colors.white : Colors.blue,
            borderRadius: BorderRadius.circular(15.w)),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              color: buttonName == 'Register'
                  ? Colors.black.withOpacity(0.7)
                  : Colors.white,
              fontSize: 16.sp),
        )),
      ),
    );
  }
}
