import 'package:booke_store/feattures/registration/presentation/widgets/registration_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/constants_router.dart';
import '../logic/registration_cubit.dart';
import 'widgets/registration_form.dart';
import 'widgets/header_page.dart';
import 'widgets/sign_up_button.dart';
import 'widgets/divider_or.dart';
import '../../../core/widgets/social_buttom/social_buttons.dart';
import 'widgets/login_link.dart';
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
            const HeaderPage(),
            SizedBox(height: 40.h),
            RegistrationForm(),
            SizedBox(height: 32.h),
            const SignUpButton(),
            SizedBox(height: 24.h),
            const DividerOR(),
            SizedBox(height: 24.h),
            const SocialButtons(),
            SizedBox(height: 32.h),
            const LoginLink(),
            RegistrationBlocListener(),
          ],
        ),
      ),
    );
  }
}

void HandleSignUp(BuildContext context) {
  context.read<RegistrationCubit>().register();
}
