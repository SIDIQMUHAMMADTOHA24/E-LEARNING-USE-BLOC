// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning/common/entities/flutter_toastt.dart';
import 'package:e_learning/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({
    required this.context,
  });
  void handleRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (userName.isEmpty) {
      ToastInfo().showToast(message: 'User name empty');
      return;
    }
    if (email.isEmpty) {
      ToastInfo().showToast(message: 'Email empty');
      return;
    }
    if (password.isEmpty) {
      ToastInfo().showToast(message: 'Password empty');
      return;
    }
    if (confirmPassword.isEmpty) {
      ToastInfo().showToast(message: 'Confirm password empty');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        ToastInfo().showToast(
            message:
                'An email has been sent to registered email. To activate it please check your email box and klik on link');
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ToastInfo().showToast(message: 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        ToastInfo().showToast(message: 'Email already in use');
      }
    }
  }
}
