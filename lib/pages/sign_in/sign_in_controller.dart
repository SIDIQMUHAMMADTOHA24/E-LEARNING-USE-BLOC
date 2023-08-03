// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/common/value/constant.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/entities/flutter_toastt.dart';
import '../../global.dart';

class SignController {
  final BuildContext context;
  SignController({
    required this.context,
  });

  void handleSign(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          ToastInfo().showToast(message: 'email empty');
          return;
        }
        if (password.isEmpty) {
          ToastInfo().showToast(message: 'password empty');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user == null) {
            ToastInfo().showToast(message: 'user null');
          }
          if (!credential.user!.emailVerified) {
            print('email not verified');
          }
          var user = credential.user;
          if (user != null) {
            Global.storageService
                .setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');
            Navigator.pushNamedAndRemoveUntil(
                context, '/aplications', (route) => false);
          } else {
            print('kesalahan');
          }
        } on FirebaseAuthException catch (error) {
          if (error.code == 'user-not-found') {
            // Handle kesalahan ketika pengguna tidak ditemukan
            ToastInfo().showToast(message: 'account not found');
          } else if (error.code == 'wrong-password') {
            // Handle kesalahan ketika kata sandi salah
            ToastInfo().showToast(message: 'wrong password');
          } else if (error.code == 'invalid-email') {
            ToastInfo().showToast(message: 'Invalid email');
          } else {
            // Handle kesalahan lainnya
            print('Terjadi kesalahan: ${error.code}');
          }
        }
      }
    } catch (e) {
      //
    }
  }
}
