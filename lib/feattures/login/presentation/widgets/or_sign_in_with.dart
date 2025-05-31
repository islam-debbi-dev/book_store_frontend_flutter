import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '- Or sign in with -',
      style: TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14.sp,
      ),
    );
  }
}
