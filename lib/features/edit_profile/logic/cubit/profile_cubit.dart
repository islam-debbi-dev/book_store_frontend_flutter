import 'package:bloc/bloc.dart';

import '../../data/models/user_profile_res.dart';
import '../../data/repository/profile_repository.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit(this.profileRepository) : super(ProfileState.initial());

  Future<void> getUserProfile() async {
    emit(ProfileState.loading());

    final userProfile = await profileRepository.getCurrentUser();
    userProfile.when(
        success: (userProfile) => emit(ProfileState.success(userProfile)),
        failure: (error) {
          emit(ProfileState.error(error.apiErrorModel.message ?? ''));
        });
  }

  void updateUserProfile(UserProfileRes userProfileRes) async {
    emit(ProfileState.updateLoading());

    final data = await profileRepository.updateCurrentUser(userProfileRes);
    data.when(
        success: (data) => emit(ProfileState.updateSuccess()),
        failure: (error) {
          emit(ProfileState.updateError(error.apiErrorModel.message ?? ''));
        });
  }
}
