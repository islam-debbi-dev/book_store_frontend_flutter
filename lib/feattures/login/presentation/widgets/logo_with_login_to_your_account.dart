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
          width: 90.w,
          height: 90.h,
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.account_balance_wallet,
            size: 50.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'cignifi',
          style: TextStyle(
            color: Color(0xFF1E3A8A),
            fontSize: 28.sp,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: 30.h),
        Text(
          'Login to your Account',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
