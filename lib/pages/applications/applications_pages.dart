import 'package:e_learning/pages/applications/applications_widget/applications_widget.dart';
import 'package:e_learning/pages/applications/bloc/app_bloc.dart';
import 'package:e_learning/pages/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationsPages extends StatefulWidget {
  const ApplicationsPages({super.key});

  @override
  State<ApplicationsPages> createState() => _ApplicationsPagesState();
}

class _ApplicationsPagesState extends State<ApplicationsPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                context.read<AppBloc>().add(TriggerAppEvent(value));
              },
              elevation: 0,
              items: bottomNavigationBar),
        );
      },
    ));
  }
}
