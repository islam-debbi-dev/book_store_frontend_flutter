import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/admin_home_cubit.dart';

class AdminAuthorsPage extends StatefulWidget {
  const AdminAuthorsPage({super.key});

  @override
  State<AdminAuthorsPage> createState() => _AdminAuthorsPageState();
}

class _AdminAuthorsPageState extends State<AdminAuthorsPage> {
  final _scrollController = ScrollController();
  int _pageNumber = 1;

  @override
  void initState() {
    super.initState();
    // Fetch initial authors using the merged cubit
    context.read<AdminHomeCubit>().fetchAuthors(_pageNumber);
    _scrollController.addListener(_onScroll);
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
                : _buildAuthorList(state); // Show list while loading more
          case DataStatus.success:
            if (state.authors.isEmpty) {
              return const Center(child: Text('No authors found.'));
            }
            return _buildAuthorList(state);
        }
      },
    );
  }

  Widget _buildAuthorList(AdminHomeState state) {
    // Use AdminHomeState
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.hasReachedMaxAuthors // Use hasReachedMaxAuthors
          ? state.authors.length // Only authors if max reached
          : state.authors.length + 1, // Authors + loading indicator
      itemBuilder: (context, index) {
        // Show loading indicator at the bottom if not max reached
        if (index >= state.authors.length) {
          return const Center(child: CircularProgressIndicator());
        }
        // Display author item
        final author = state.authors[index];
        return ListTile(
          leading: CircleAvatar(child: Text('')), // Example avatar
          title: Text(author.firstName ?? ''),
          subtitle: Text(
              author.lastName ?? 'No bio available'), // Handle nullable bio
          // Add onTap or trailing icons for edit/delete later
        );
      },
    );
  }

  void _onScroll() {
    if (_isBottom)
      context
          .read<AdminHomeCubit>()
          .fetchAuthors(_pageNumber); // Use AdminHomeCubit
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger fetch slightly before reaching the absolute bottom
    _pageNumber += 1;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
