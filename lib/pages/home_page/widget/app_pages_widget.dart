import 'package:e_learning/pages/export.dart';

AppBar buildAppPages() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: 12.h,
          width: 15.w,
          child: Image.asset('assets/icons/menu.png'),
        ),
        SizedBox(
          height: 40.h,
          width: 40.w,
          child: Image.asset('assets/icons/person.png'),
        )
      ]),
    ),
  );
}
