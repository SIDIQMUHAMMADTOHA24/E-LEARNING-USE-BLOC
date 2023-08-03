// ignore_for_file: prefer_const_constructors

import 'package:e_learning/pages/register/bloc/register_bloc.dart';
import 'package:e_learning/pages/register/register_controller.dart';
import 'package:e_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:e_learning/pages/sign_in/sign_in_widget/build_text_field_widget.dart';
import 'package:e_learning/pages/sign_in/sign_in_widget/reusable_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../export.dart';
import '../sign_in/sign_in_widget/login_reg_widget.dart';

class RegisterPages extends StatelessWidget {
  const RegisterPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left_outlined,
                      size: 35.sp,
                      color: Colors.black,
                    )),
                title: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                        child: Center(
                          child: const ReusableText(
                              text: 'Enter your detail bellow & free sign up'),
                        ),
                      ),
                      const ReusableText(
                        text: 'User name',
                      ),
                      // !User Name
                      BuildTextField(
                        hintText: 'Enter your user name ',
                        iconName: 'person',
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserName(userName: value));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReusableText(
                        text: 'Email',
                      ),
                      //! Email
                      BuildTextField(
                        hintText: 'Enter your email addreas',
                        iconName: 'person',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(Email(email: value));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReusableText(
                        text: 'Password',
                      ),
                      //! Password
                      BuildTextField(
                        hintText: 'Enter your password',
                        iconName: 'lock',
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(Password(password: value));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ReusableText(
                        text: 'Confirm password',
                      ),
                      //!Confirm Password
                      BuildTextField(
                        hintText: 'Enter your confirm password',
                        iconName: 'lock',
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(ConfimPassword(confirmPassword: value));
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const ReusableText(
                          text:
                              'By creating an account your have to agree with our them & condication'),
                      SizedBox(
                        height: 35.h,
                      ),
                      LogRegButton(
                        buttonName: 'Register',
                        onTap: () {
                          RegisterController(context: context).handleRegister();
                        },
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
