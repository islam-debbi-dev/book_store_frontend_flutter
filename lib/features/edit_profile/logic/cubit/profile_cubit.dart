import 'package:bloc/bloc.dart';

import '../../data/repository/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit(this.profileRepository) : super(ProfileState.initial());

  void getUserProfile() async {
    emit(ProfileState.loading());

    final userProfile = await profileRepository.getCurrentUser();
    userProfile.when(
        success: (userProfile) => emit(ProfileState.success(userProfile)),
        failure: (error) {
          emit(ProfileState.error(error.apiErrorModel.message ?? ''));
        });
  }
}
