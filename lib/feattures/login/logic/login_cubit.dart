import 'package:bloc/bloc.dart';
import 'package:booke_store/feattures/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

import '../data/models/login_req.dart';
import '../data/models/login_res.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      print('Logging in with email: ${emailController.text}');
      print('Logging in with password: ${passwordController.text}');
      final loginReq = LoginReq(
        // email: emailController.text,
        // password: passwordController.text,
        email: 'admin@email.com',
        password: 'Qwerty1234',
      );
      emit(LoginLoading());
      try {
        final loginRes = await loginRepo.login(loginReq);
        emit(LoginSuccess(loginRes));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }

  void reset() {
    emit(LoginInitial());
  }
}
