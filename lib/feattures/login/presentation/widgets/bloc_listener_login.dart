import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/constants_router.dart';
import '../../logic/login_cubit.dart';

class BlocListenerLogin extends StatefulWidget {
  const BlocListenerLogin({super.key});

  @override
  State<BlocListenerLogin> createState() => _BlocListenerLoginState();
}

class _BlocListenerLoginState extends State<BlocListenerLogin> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(loadingSnackBar());
        }
        if (state is LoginSuccess) {
          await ScaffoldMessenger.of(context)
              .showSnackBar(successSnackBar())
              .closed;
          Navigator.pop(context);
          if (state.loginRes.isAdmin == true) {
            print(state.loginRes.isAdmin);
            Navigator.pushNamed(context, adminhomepage,
                arguments: state.loginRes);
          }
          if (state.loginRes.isAdmin == false) {
            Navigator.pushNamed(context, homepage, arguments: state.loginRes);
          }
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar(state.errorMessage));
        }
      },
      child: Container(),
    );
  }
}

SnackBar loadingSnackBar() {
  return const SnackBar(
    content: Text('Loading...'),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}

SnackBar successSnackBar() {
  return const SnackBar(
    content: Text('Login Successful'),
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}

SnackBar errorSnackBar(String errorMessage) {
  return SnackBar(
    content: Text('$errorMessage'),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    backgroundColor: Colors.red,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}
