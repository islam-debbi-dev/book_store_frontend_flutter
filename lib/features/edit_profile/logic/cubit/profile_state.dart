import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_profile_res.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.success(UserProfileRes userProfile) =
      ProfileSuccess;
  const factory ProfileState.error(String errorMessage) = ProfileError;

  // update user states
  const factory ProfileState.updateLoading() = ProfileUpdateLoading;
  const factory ProfileState.updateSuccess() = ProfileUpdateSuccess;
  const factory ProfileState.updateError(String errorMessage) =
      ProfileUpdateError;
}
