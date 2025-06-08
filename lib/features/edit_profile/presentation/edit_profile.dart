import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/profile_cubit.dart';
import '../logic/cubit/profile_state.dart';
import 'widgets/edit_profile_view.dart';
import 'widgets/error_widget_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: showLoadingIndicator());
          }
          if (state is ProfileSuccess) {
            final user = state.userProfile;
            return EditProfileView(userProfile: user);
            //Profile(adminInfo: userProfile);
          } else if (state is ProfileError) {
            return errorWidgetProfile(state.errorMessage, context);
          }
          // Handle other states as needed
          return Center(
              child: TextButton(
            child: Text('reload'),
            onPressed: () {
              context.read<ProfileCubit>().getUserProfile();
            },
          ));
        },
      ),
    );
  }
}

Widget showLoadingIndicator() {
  return Container(
    color: Colors.black,
    child: Center(
      child: Image.asset('assets/images/icon_loading.gif'),
    ),
  );
}
