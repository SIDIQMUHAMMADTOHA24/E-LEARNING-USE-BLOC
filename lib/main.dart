import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/routes/pages.dart';
import 'global.dart';

void main(List<String> args) async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppPages.GenerateRouteSettings,
          ),
        ));
  }
}
