import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/registration_cubit.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController =
        BlocProvider.of<RegistrationCubit>(context).emailController;
    _usernameController =
        BlocProvider.of<RegistrationCubit>(context).usernameController;
    _passwordController =
        BlocProvider.of<RegistrationCubit>(context).passwordController;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegistrationCubit>(context).registrationFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildTextField(
            controller: _emailController,
            hint: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            context: context,
          ),
          SizedBox(height: 16.h),
          BuildTextField(
            controller: _usernameController,
            hint: 'Username',
            icon: Icons.person,
            context: context,
          ),
          SizedBox(height: 16.h),
          BuildTextField(
            controller: _passwordController,
            hint: 'Password',
            icon: Icons.lock,
            obscureText: true,
            context: context,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

Widget BuildTextField({
  required BuildContext context,
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  bool obscureText = false,
  TextInputType? keyboardType,
  Widget? suffixIcon,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    validator: validator,
    decoration: InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary, width: 3),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    ),
  );
}
