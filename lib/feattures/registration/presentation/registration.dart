import 'package:booke_store/feattures/registration/presentation/widgets/registration_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/constants_router.dart';
import '../logic/registration_cubit.dart';
import 'widgets/registration_form.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Register'),
        actions: [
          IconButton(
            icon: Icon(Icons.backspace, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, login);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            RegistrationForm(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<RegistrationCubit>().register();
              },
              child: Text('Register'),
            ),
            RegistrationBlocListener(),
          ],
        ),
      ),
    );
  }
}
