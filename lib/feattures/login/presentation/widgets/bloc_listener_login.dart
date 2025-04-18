import 'package:booke_store/core/router/constants_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/login_cubit.dart';

class BlocListenerLogin extends StatefulWidget {
  const BlocListenerLogin({super.key});

  @override
  State<BlocListenerLogin> createState() => _BlocListenerLoginState();
}

class _BlocListenerLoginState extends State<BlocListenerLogin> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          Center(child: CircularProgressIndicator());
        }
        if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, homepage);
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Container(),
    );
  }
}
