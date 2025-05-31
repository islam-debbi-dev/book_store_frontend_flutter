import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/login_cubit.dart';
import 'build_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    passwordController =
        BlocProvider.of<LoginCubit>(context).passwordController;
    emailController = BlocProvider.of<LoginCubit>(context).emailController;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<LoginCubit>(context).loginFormKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Email Field
            BuildTextField(
              controller: emailController,
              icon: Icons.email_outlined,
              label: 'Email',
            ),
            SizedBox(height: 20.h),
            // Password Field
            BuildTextField(
                controller: passwordController,
                icon: Icons.lock_outlined,
                label: 'Password',
                isPassword: true),
            SizedBox(height: 32.h),
            // TextField(
            //   controller: emailController,
            //   decoration: const InputDecoration(
            //     labelText: 'Email',
            //     border: OutlineInputBorder(),
            //   ),
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // const SizedBox(height: 16),
            // TextField(
            //   controller: passwordController,
            //   decoration: const InputDecoration(
            //     labelText: 'Password',
            //     border: OutlineInputBorder(),
            //   ),
            //   obscureText: true,
            // ),
            //const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
