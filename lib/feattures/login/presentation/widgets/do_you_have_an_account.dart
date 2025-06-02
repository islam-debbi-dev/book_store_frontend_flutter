import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/router/constants_router.dart';

class DoYouHaveAnAccount extends StatefulWidget {
  const DoYouHaveAnAccount({super.key});

  @override
  State<DoYouHaveAnAccount> createState() => _DoYouHaveAnAccountState();
}

class _DoYouHaveAnAccountState extends State<DoYouHaveAnAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 14.sp,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, register),
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Color(0xFF1D4ED8),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
