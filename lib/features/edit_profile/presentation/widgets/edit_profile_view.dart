import 'package:booke_store/features/edit_profile/data/models/user_profile_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/edit_able_profile_pic.dart';

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
          //top: MediaQuery.of(context).size.height.h * 0.25.h,
          // Adjust this to center vertically in your ClipPath
          child: Container(
            padding: EdgeInsets.only(
              top: 100.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditableProfilePicture(50),
                  SizedBox(height: 20.h),
                  Profilefield(Icons.person, user.username ?? ''),
                  Profilefield(Icons.lock, "You can't See a Password "),
                  Profilefield(Icons.email, user.email ?? ''),
                  Profilefield(Icons.admin_panel_settings,
                      user.isAdmin.toString() ?? ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom clipper for pink background
class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);

    // Create curved bottom
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height + 50, size.width, size.height - 100);

    path.cubicTo(size.width * 0.2, size.height - 70, size.width * 0.8,
        size.height + 60, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom clipper for blue background (different curve)
class BlueCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);

    // Create different curved pattern
    path.cubicTo(size.width * 0.1, size.height - 80, size.width * 0.8,
        size.height + 80, size.width, size.height - 100);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

Widget Profilefield(IconData icon, String title, {bool isLogout = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Slidable(
      key: ValueKey(title),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // TODO: Add edit action
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
          onTap: () {},
        ),
      ),
    ),
  );
}
