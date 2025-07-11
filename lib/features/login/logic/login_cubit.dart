import 'package:bloc/bloc.dart';
import 'package:booke_store/features/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/shared_pref_helper.dart';
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
      final loginReq = LoginReq(
        // email: emailController.text,
        // password: passwordController.text,
        email: 'admin@email.com',
        password: 'Qwerty1234',
      );
      emit(LoginLoading());
      try {
        final response = await loginRepo.login(loginReq);
        response.when(
          success: (data) async {
            await saveUserData(data);
            await saveUserToken(data.token ?? "");
            emit(LoginSuccess(data));
          },
          failure: (error) {
            emit(LoginFailure(error.apiErrorModel.message ?? ''));
          },
        );
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }

  void reset() {
    emit(LoginInitial());
  }

  Future<void> saveUserToken(String token) async {
    // save token to shared pref
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
  }

  // save user data to shared pref
  Future<void> saveUserData(LoginRes data) async {
    await SharedPrefHelper.setData(SharedPrefKeys.username, data.username);
    await SharedPrefHelper.setData(SharedPrefKeys.email, data.email);
    await SharedPrefHelper.setData(SharedPrefKeys.id, data.id);
    await SharedPrefHelper.setData(SharedPrefKeys.isAdmin, data.isAdmin);
  }
}
