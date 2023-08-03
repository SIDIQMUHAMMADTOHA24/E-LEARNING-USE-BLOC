import 'package:e_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:e_learning/pages/sign_in/sign_in_controller.dart';
import 'package:e_learning/pages/sign_in/sign_in_widget/build_text_field_widget.dart';
import 'package:e_learning/pages/sign_in/sign_in_widget/build_threed_party_widget.dart';
import 'package:e_learning/pages/sign_in/sign_in_widget/reusable_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../export.dart';
import 'sign_in_widget/login_reg_widget.dart';
import 'sign_in_widget/forget_widget.dart';

class SiginPages extends StatelessWidget {
  const SiginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildThreedParty(
                      nameIcons: 'google',
                    ),
                    BuildThreedParty(
                      nameIcons: 'facebook',
                    ),
                    BuildThreedParty(
                      nameIcons: 'apple',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 35.h),
                  child: const ReusableText(
                      text: 'Or use your email account to login'),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableText(
                        text: 'Email',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BuildTextField(
                        hintText: 'Enter your email addreas',
                        iconName: 'person',
                        onChanged: (value) {
                          context
                              .read<SignInBloc>()
                              .add(EmailEvent(email: value));
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableText(
                        text: 'Password',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      BuildTextField(
                        hintText: 'Enter your email addreas',
                        iconName: 'lock',
                        onChanged: (value) {
                          context
                              .read<SignInBloc>()
                              .add(PasswordEvent(password: value));
                        },
                      ),
                    ],
                  ),
                ),
                const ForgetPassword(),
                SizedBox(
                  height: 35.h,
                ),
                LogRegButton(
                  buttonName: 'Login',
                  onTap: () {
                    SignController(context: context).handleSign('email');
                  },
                ),
                LogRegButton(
                  buttonName: 'Register',
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
