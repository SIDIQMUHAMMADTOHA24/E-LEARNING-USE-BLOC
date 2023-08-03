import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning/pages/welcome/widget/pages_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (value) {
                  state.page = value;
                  context.read<WelcomeBloc>().add(WelcomeEvent());
                },
                children: [
                  Pages(
                    pageController: pageController,
                    index: 1,
                    ctx: context,
                    imagePath: 'assets/images/reading.png',
                    title: 'Frist See Learning',
                    subTitle:
                        'Forget about a for paper all knowledge in one learning',
                    buttonName: 'next',
                  ),
                  Pages(
                    pageController: pageController,
                    index: 2,
                    ctx: context,
                    imagePath: 'assets/images/boy.png',
                    title: 'Conneect With Everyone',
                    subTitle:
                        'Always keep in touch with your tutor & friend. Let\'s get connected',
                    buttonName: 'next',
                  ),
                  Pages(
                    pageController: pageController,
                    index: 3,
                    ctx: context,
                    imagePath: 'assets/images/man.png',
                    title: 'Always Facinated Learning',
                    subTitle:
                        'Anywhere, anytime. The time is at our disction so study whenever you want',
                    buttonName: 'get started',
                  ),
                ],
              ),
              Positioned(
                  bottom: 50.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        activeColor: Colors.blue,
                        activeSize: const Size(18, 9),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ))
            ],
          );
        },
      )),
    );
  }
}
