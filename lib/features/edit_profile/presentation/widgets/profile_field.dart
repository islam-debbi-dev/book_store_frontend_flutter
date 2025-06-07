// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../../data/models/user_profile_res.dart';
// import '../../logic/cubit/profile_cubit.dart';

// class ProfileField extends StatefulWidget {
//   final String titleOfField;
//   final IconData icon;
//   final String title;
//   final BuildContext context1;
//   final UserProfileRes user;
//   final bool isLogout;

//   const ProfileField({
//     Key? key,
//     required this.titleOfField,
//     required this.icon,
//     required this.title,
//     required this.context1,
//     required this.user,
//     this.isLogout = false,
//   }) : super(key: key);

//   @override
//   State<ProfileField> createState() => _ProfileFieldState();
// }

// class _ProfileFieldState extends State<ProfileField> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Slidable(
//         key: ValueKey(widget.title),
//         endActionPane: ActionPane(
//           motion: const DrawerMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) async {
//                 String? result = await showCupertinoDialog<String>(
//                   context: context,
//                   builder: (BuildContext context) {
//                     TextEditingController controller =
//                         TextEditingController(text: widget.title);
//                     return CupertinoAlertDialog(
//                       title: Text('Edit'),
//                       content: Column(
//                         children: [
//                           SizedBox(height: 10),
//                           CupertinoTextField(
//                             controller: controller,
//                             placeholder: 'Enter new value',
//                           ),
//                         ],
//                       ),
//                       actions: [
//                         CupertinoDialogAction(
//                           child: Text('Cancel'),
//                           onPressed: () => Navigator.of(context).pop(),
//                         ),
//                         CupertinoDialogAction(
//                           child: Text('Update'),
//                           isDefaultAction: true,
//                           onPressed: () async {
//                             await updateUser(widget.context1, controller,
//                                 widget.titleOfField, widget.user);
//                             widget.context1
//                                 .read<ProfileCubit>()
//                                 .getUserProfile();
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 if (result != null && result != widget.title) {
//                   // Call the update function with the new value
//                 }
//               },
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.white,
//               icon: Icons.edit,
//               label: 'Edit',
//             ),
//             if (widget.isLogout)
//               SlidableAction(
//                 onPressed: (context) {
//                   // TODO: Add logout action
//                 },
//                 backgroundColor: Colors.red,
//                 foregroundColor: Colors.white,
//                 icon: Icons.logout,
//                 label: 'Logout',
//               ),
//           ],
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: widget.isLogout ? Colors.red[50] : Colors.grey[100],
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: ListTile(
//             leading: Icon(widget.icon,
//                 color: widget.isLogout ? Colors.red : Colors.black),
//             title: Text(
//               widget.title,
//               style:
//                   TextStyle(color: widget.isLogout ? Colors.red : Colors.black),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<void> updateUser(context, TextEditingController controller, String value,
//     UserProfileRes user) async {
//   if (value == 'username') {
//     BlocProvider.of<ProfileCubit>(context).updateUserProfile(
//         UserProfileRes(id: user.id, username: controller.text.toString()));
//   }
//   if (value == 'email') {
//     BlocProvider.of<ProfileCubit>(context).updateUserProfile(
//         UserProfileRes(id: user.id, email: controller.text.toString()));
//   }
//   if (value == 'password') {
//     BlocProvider.of<ProfileCubit>(context).updateUserProfile(
//         UserProfileRes(id: user.id, password: controller.text.toString()));
//   }
// }
