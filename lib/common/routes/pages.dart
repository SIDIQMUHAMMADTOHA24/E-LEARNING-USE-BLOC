// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/common/routes/name.dart';
import 'package:e_learning/pages/applications/applications_pages.dart';
import 'package:e_learning/pages/applications/bloc/app_bloc.dart';
import 'package:e_learning/pages/export.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:e_learning/pages/welcome/welcome_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/register/bloc/register_bloc.dart';
import '../../pages/register/register_pages.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in_pages.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          routes: AppRoutes.INITIAL,
          pages: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          routes: AppRoutes.SIGN_IN,
          pages: const SiginPages(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          routes: AppRoutes.REGISTER,
          pages: const RegisterPages(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          routes: AppRoutes.APPLICATIONS,
          pages: const ApplicationsPages(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[]; // sama seprti [] list kosong
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //! fungsi where berfungsi untuk mengfilter
      var resault =
          routes().where((element) => element.routes == settings.name);
      if (resault.isNotEmpty) {
        print('frist log');
        print(resault.first.routes);
        bool deviceFristOpen = Global.storageService.getDeviceFristOpen();
        if (resault.first.routes == AppRoutes.INITIAL && deviceFristOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (context) => const ApplicationsPages(),
                settings: settings);
          }
          return MaterialPageRoute(
              builder: (context) => const SiginPages(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (context) => resault.first.pages, settings: settings);
      }
    }
    print('invalid routes ${settings.name}');
    return MaterialPageRoute(
        builder: (context) => const SiginPages(), settings: settings);
  }
}

class PageEntity {
  String routes;
  Widget pages;
  dynamic bloc;
  PageEntity({
    required this.routes,
    required this.pages,
    this.bloc,
  });
}
