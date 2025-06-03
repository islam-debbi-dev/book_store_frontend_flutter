import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWithLoginText extends StatelessWidget {
  const LogoWithLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        // Logo
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.account_balance_wallet,
            size: 60.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'cignifi',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
          child: Container(
            width: double.infinity.w,
            height: 1.h,
            color: Colors.black,
          ),
        ),
        Text(
          'Login to your Account',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
