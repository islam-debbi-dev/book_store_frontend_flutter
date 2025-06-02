import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/constants.dart';
import '../../logic/admin_home_cubit.dart';
import 'authors_view.dart';

class AdminAuthorsPage extends StatefulWidget {
  const AdminAuthorsPage({super.key});

  @override
  State<AdminAuthorsPage> createState() => _AdminAuthorsPageState();
}

class _AdminAuthorsPageState extends State<AdminAuthorsPage> {
  @override
  void initState() {
    super.initState();

    context.read<AdminHomeCubit>().fetchAuthors(pageNumberAuthor);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminHomeCubit, AdminHomeState>(
      // Use AdminHomeCubit and AdminHomeState
      builder: (context, state) {
        switch (state.authorStatus) {
          // Check authorStatus specifically
          case DataStatus.error:
            return Center(
                child: Text(
                    'Error: ${state.authorErrorMessage}')); // Use authorErrorMessage
          case DataStatus.initial: // Show loading on initial state too
          case DataStatus.loading:
            // Show centered loading indicator only on initial load
            return state.authors.isEmpty &&
                    state.authorStatus ==
                        DataStatus
                            .initial // Be more specific for initial loading
                ? const Center(child: CircularProgressIndicator())
                : AuthorsView(
                    authors: state.authors); // Show list while loading more
          case DataStatus.success:
            if (state.authors.isEmpty) {
              return const Center(child: Text('No authors found.'));
            }
            return AuthorsView(authors: state.authors);
        }
      },
    );
  }
}
