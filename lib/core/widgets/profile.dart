// lib/core/widgets/profile.dart
import 'package:booke_store/core/helpers/shared_pref_helper.dart';
import 'package:booke_store/core/router/constants_router.dart';
import 'package:flutter/material.dart';
import '../../feattures/login/data/models/login_res.dart';
import '../helpers/constants.dart'; // Import LoginRes

class Profile extends StatefulWidget {
  final LoginRes userInfo;

  const Profile({
    required this.userInfo,
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Username:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            widget.userInfo.username ?? 'N/A',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          Text(
            'Email:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            widget.userInfo.email ?? 'N/A',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                // clear all storage data
                clearPageNumbers();
                SharedPrefHelper.clearAllData();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    login, (Route<dynamic> route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
