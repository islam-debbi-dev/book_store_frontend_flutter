import 'package:booke_store/feattures/registration/presentation/widgets/registration_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/constants_router.dart';
import '../logic/registration_cubit.dart';
import 'widgets/registration_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 60.h),
            HeaderPage(),
            SizedBox(height: 40.h),
            RegistrationForm(),
            SizedBox(height: 32.h),
            SignUpButton(context),
            SizedBox(height: 24.h),
            DividerOR(),
            SizedBox(height: 24.h),
            SocialButtons(),
            SizedBox(height: 32.h),
            LoginLink(context),
            RegistrationBlocListener(),
          ],
        ),
      ),
    );
  }
}

Widget HeaderPage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Create Account',
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1A1A1A),
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        'Sign up to get started',
        style: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xFF666666),
        ),
      ),
    ],
  );
}

Widget SignUpButton(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 52.h,
    child: ElevatedButton(
      onPressed: () {
        context.read<RegistrationCubit>().register();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C5CE7),
        foregroundColor: Colors.white,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Widget DividerOR() {
  return Row(
    children: [
      const Expanded(child: Divider(color: Color(0xFFE5E5E5))),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          'OR',
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFF666666)),
        ),
      ),
      const Expanded(child: Divider(color: Color(0xFFE5E5E5))),
    ],
  );
}

Widget SocialButtons() {
  return Row(
    children: [
      Expanded(child: _buildSocialButton('Google', Icons.g_mobiledata)),
      SizedBox(width: 16.w),
      Expanded(child: _buildSocialButton('Apple', Icons.apple)),
    ],
  );
}

Widget _buildSocialButton(String text, IconData icon) {
  return SizedBox(
    height: 52.h,
    child: OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFF1A1A1A)),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF1A1A1A),
          fontWeight: FontWeight.w500,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFE5E5E5)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
    ),
  );
}

Widget LoginLink(context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFF666666)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, login);
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF6C5CE7),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

void HandleSignUp(BuildContext context) {
  context.read<RegistrationCubit>().register();
}
