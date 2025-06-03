import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import '../../../../../core/router/constants_router.dart';
import '../../../../../core/widgets/edit_able_profile_pic.dart';
import '../../../../login/data/models/login_res.dart';

class AdminProfilePage extends StatelessWidget {
  final LoginRes adminInfo;
  const AdminProfilePage({required this.adminInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Container(
                color: const Color.fromARGB(255, 36, 75, 44),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ]),
        ),
        Positioned(
          top: 30.h,
          left: 0,
          right: 0,
          child: Center(child: EditableProfilePicture(size: 120)),
        ),
        Positioned(
          top: 200.h,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
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
                  MenuItem(Icons.edit, "Edit Profile Name", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.list_alt, "List project", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.lock_outline, "Change Password", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.email_outlined, "Change Email Address", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.settings_outlined, "Settings", () {
                    // handle navigation
                  }),
                  MenuItem(Icons.tune, "Preferences", () {
                    // handle navigation
                  }),
                  const SizedBox(height: 20),
                  const Divider(),
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

Widget MenuItem(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.green),
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
