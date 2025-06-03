import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'social_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SocialButton('Google', Icons.g_mobiledata)),
        SizedBox(width: 16.w),
        Expanded(child: SocialButton('Apple', Icons.apple)),
      ],
    );
  }
}