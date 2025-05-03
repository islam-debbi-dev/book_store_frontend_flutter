import 'package:flutter/material.dart';

import '../../../../login/data/models/login_res.dart';

class AdminProfilePage extends StatelessWidget {
  final LoginRes adminInfo;
  const AdminProfilePage({required this.adminInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page for ${adminInfo.username}'));
  }
}
