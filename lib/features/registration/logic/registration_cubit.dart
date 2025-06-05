import 'package:bloc/bloc.dart';
import 'package:booke_store/features/registration/data/repo/registration_repo.dart';
import 'package:flutter/material.dart';

import '../data/models/registration_req.dart';
import '../data/models/registration_res.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.registrationRepo) : super(RegistrationInitial());
  final RegistrationRepo registrationRepo;

  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  Future<void> register() async {
    if (registrationFormKey.currentState?.validate() ?? false) {
      emit(RegistrationLoading());
      final registrationReq = RegistrationReq(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text,
      );
      try {
        final response = await registrationRepo.register(registrationReq);
        response.when(
          success: (data) async {
            emit(RegistrationSuccess(data));
          },
          failure: (error) {
            emit(RegistrationFailure(error.apiErrorModel.message ?? ''));
          },
        );
      } catch (e) {
        emit(RegistrationFailure(e.toString()));
      }
    } else {
      emit(RegistrationFailure("Form is not valid"));
    }
  }
}
