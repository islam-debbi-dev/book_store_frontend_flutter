import 'package:booke_store/core/router/constants_router.dart';
import 'package:booke_store/features/login/data/models/login_res.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final LoginRes arguments;
  const Homepage(this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('welcome ${arguments.username ?? ''}'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(context, login);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Homepage'),
      ),
    );
  }
}
