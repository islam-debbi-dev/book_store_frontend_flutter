import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../features/login/presentation/widgets/build_social_button.dart';

class SocialLoginButtons extends StatefulWidget {
  const SocialLoginButtons({super.key});

  @override
  State<SocialLoginButtons> createState() => _State();
}

class _State extends State<SocialLoginButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          icon: FontAwesomeIcons.google,
          color: Colors.red,
        ),
        SizedBox(width: 20.w),
        SocialLoginButton(
          icon: FontAwesomeIcons.facebookF,
          color: Color(0xFF1877F2),
        ),
        SizedBox(width: 20.w),
        SocialLoginButton(
          icon: FontAwesomeIcons.twitter,
          color: const Color(0xFF1DA1F2),
        ),
      ],
    );
  }
}
