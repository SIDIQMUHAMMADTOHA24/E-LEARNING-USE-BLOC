import '../../../common/value/constant.dart';
import '../../../global.dart';
import '../../export.dart';

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.index,
    required this.ctx,
    required this.title,
    required this.subTitle,
    required this.buttonName,
    required this.imagePath,
    required this.pageController,
  });

  final int index;
  final BuildContext ctx;
  final String title;
  final String subTitle;
  final String buttonName;
  final String imagePath;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(imagePath),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24.sp),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5), fontSize: 14.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate);
            } else {
              Global.storageService
                  .setBool(AppConstant.STORAGE_DEVICE_OPEN_FRIST_TIME, true);
              print(
                  'the value is ${Global.storageService.getDeviceFristOpen()}');
              Navigator.of(ctx)
                  .pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 90.h, right: 20.w, left: 20.w),
            height: 60.h,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15.w)),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            )),
          ),
        )
      ],
    );
  }
}
