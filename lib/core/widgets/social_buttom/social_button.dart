import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const SocialButton(this.text, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }
}