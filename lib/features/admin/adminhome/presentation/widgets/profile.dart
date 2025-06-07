import 'package:booke_store/features/login/data/models/login_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/router/constants_router.dart';
import '../../../../../core/widgets/able_profile_pic.dart';

class Profile extends StatelessWidget {
  final LoginRes adminInfo;
  const Profile({required this.adminInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ]),
        ),
        Positioned(
          top: 80.h,
          left: 0,
          right: 0,
          child: Center(child: AbleProfilePicture(size: 120)),
        ),
        Positioned(
          top: 300.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 0.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  MenuItem(Icons.edit, Theme.of(context).colorScheme.secondary,
                      "Edit Profile ", () {
                    Navigator.pushNamed(context, editProfile);
                    // handle navigation
                  }),
                  MenuItem(
                      Icons.list_alt,
                      Theme.of(context).colorScheme.secondary,
                      "List project", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.settings_outlined,
                      Theme.of(context).colorScheme.secondary, "Settings", () {
                    Navigator.pushNamed(context, settingsPage);
                  }),
                  MenuItem(Icons.info_outline,
                      Theme.of(context).colorScheme.secondary, "About", () {
                    // handle navigation
                  }),
                  SizedBox(height: 15.h),
                  LogoutItem(() {
                    clearPageNumbers();
                    SharedPrefHelper.clearAllData();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        login, (Route<dynamic> route) => false);
                  }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget MenuItem(
    IconData icon, Color iconColor, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: iconColor),
    title: Text(title),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    onTap: onTap,
  );
}

Widget LogoutItem(VoidCallback onTap) {
  return ListTile(
    leading: const Icon(Icons.logout, color: Colors.red),
    title: const Text("Logout", style: TextStyle(color: Colors.red)),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
    onTap: onTap,
  );
}
