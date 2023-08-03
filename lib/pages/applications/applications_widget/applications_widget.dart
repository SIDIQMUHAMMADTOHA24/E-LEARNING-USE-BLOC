import 'package:e_learning/pages/export.dart';

import '../../home_page/home_pages.dart';

Widget buildPage(int index) {
  List<Widget> page = [
    const HomePages(),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Course'),
    ),
    const Center(
      child: Text('Chat'),
    ),
    const Center(
      child: Text('Profile'),
    )
  ];
  return page[index];
}

List<BottomNavigationBarItem> bottomNavigationBar = [
  BottomNavigationBarItem(
      activeIcon: SizedBox(
          height: 20.h,
          child: Image.asset(
            'assets/icons/home.png',
            color: Colors.blue,
          )),
      icon: SizedBox(
          height: 20.h,
          child: Image.asset(
            'assets/icons/home.png',
          )),
      label: ''),
  BottomNavigationBarItem(
      icon: SizedBox(
          height: 20.h, child: Image.asset('assets/icons/search2.png')),
      label: ''),
  BottomNavigationBarItem(
      icon: SizedBox(
          height: 20.h, child: Image.asset('assets/icons/play-circle1.png')),
      label: ''),
  BottomNavigationBarItem(
      icon: SizedBox(
          height: 20.h, child: Image.asset('assets/icons/message-circle.png')),
      label: ''),
  BottomNavigationBarItem(
      icon: SizedBox(
          height: 20.h, child: Image.asset('assets/icons/person2.png')),
      label: '')
];
