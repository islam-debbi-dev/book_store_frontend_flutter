import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/constants_router.dart';
import '../../logic/registration_cubit.dart';

class RegistrationBlocListener extends StatefulWidget {
  const RegistrationBlocListener({super.key});

  @override
  State<RegistrationBlocListener> createState() =>
      _RegistrationBlocListenerState();
}

class _RegistrationBlocListenerState extends State<RegistrationBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listenWhen: (context, state) {
        return state is RegistrationLoading ||
            state is RegistrationSuccess ||
            state is RegistrationFailure;
      },
      listener: (context, state) async {
        if (state is RegistrationLoading) {
          ScaffoldMessenger.of(context).showSnackBar(loadingSnackBar());
        } else if (state is RegistrationSuccess) {
          await ScaffoldMessenger.of(context)
              .showSnackBar(successSnackBar())
              .closed;
          Navigator.pushNamed(context, login);
        } else if (state is RegistrationFailure) {
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
    content: Text('Registration Successful'),
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
    content: Text('${errorMessage}'),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    backgroundColor: Colors.red,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
}
