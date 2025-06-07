import 'package:booke_store/features/edit_profile/data/models/user_profile_res.dart';
import 'package:booke_store/features/edit_profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/edit_able_profile_pic.dart';
import 'clipper_background.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key, required this.userProfile});
  final UserProfileRes userProfile;
  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late UserProfileRes user = widget.userProfile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue curved background (like right screen)
        Container(
          height: MediaQuery.of(context).size.height.h * 1.h,
        ),
        ClipPath(
          clipper: BlueCurvedClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height.h * 0.6.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(
              top: 50.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditableProfilePicture(50),
                  SizedBox(height: 20.h),
                  Profilefield('username', Icons.person, user.username ?? '',
                      context, user),
                  Profilefield('password', Icons.lock,
                      "You can't See a Password ", context, user),
                  Profilefield(
                      'email', Icons.email, user.email ?? '', context, user),
                  Profilefield('isAdmin', Icons.admin_panel_settings,
                      user.isAdmin.toString(), context, user),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget Profilefield(String titleOfField, IconData icon, String title,
    BuildContext context1, UserProfileRes user,
    {bool isLogout = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Slidable(
      key: ValueKey(title),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              String? result = await showCupertinoDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController controller =
                      TextEditingController(text: title);
                  return CupertinoAlertDialog(
                    title: Text('Edit'),
                    content: Column(
                      children: [
                        SizedBox(height: 10),
                        CupertinoTextField(
                          controller: controller,
                          placeholder: 'Enter new value',
                        ),
                      ],
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () async {
                          await updateUser(
                              context1, controller, titleOfField, user);
                          await context1
                              .read<ProfileCubit>()
                              .getUserProfile(); // Call this first
                          Navigator.of(context).pop();
                        },
                        child: Text('Update'),
                      ),
                    ],
                  );
                },
              );
              if (result != null && result != title) {
                // Call the update function with the new value
              }
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          if (isLogout)
            SlidableAction(
              onPressed: (context) {
                // TODO: Add logout action
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.logout,
              label: 'Logout',
            ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isLogout ? Colors.red[50] : Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
          title: Text(
            title,
            style: TextStyle(color: isLogout ? Colors.red : Colors.black),
          ),
        ),
      ),
    ),
  );
}

Future<void> updateUser(context, TextEditingController controller, String value,
    UserProfileRes user) async {
  if (value == 'username') {
    BlocProvider.of<ProfileCubit>(context).updateUserProfile(
        UserProfileRes(id: user.id, username: controller.text.toString()));
  }
  if (value == 'email') {
    BlocProvider.of<ProfileCubit>(context).updateUserProfile(
        UserProfileRes(id: user.id, email: controller.text.toString()));
  }
  if (value == 'password') {
    BlocProvider.of<ProfileCubit>(context).updateUserProfile(
        UserProfileRes(id: user.id, password: controller.text.toString()));
  }
}
