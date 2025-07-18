import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/social_buttom/social_buttons.dart';
import '../logic/login_cubit.dart';
import 'widgets/bloc_listener_login.dart';
import 'widgets/do_you_have_an_account.dart';
import 'widgets/login_form.dart';
import 'widgets/logo_with_login_to_your_account.dart';
import 'widgets/or_sign_in_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.h),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                // Logo
                const LogoWithLoginText(),
                // Login Form
                const LoginForm(),

                // Sign In Button
                SizedBox(
                  width: 250.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                OrSignInWith(),
                SizedBox(height: 24.h),
                // Social Login Buttons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SocialButtons(),
                ),
                SizedBox(height: 40.h),
                //do you have an account
                DoYouHaveAnAccount(),
                SizedBox(height: 40.h),
                BlocListenerLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
