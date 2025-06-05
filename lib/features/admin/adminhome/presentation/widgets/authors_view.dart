import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../data/models/author.dart';
import '../../logic/admin_home_cubit.dart';
import '../../../../../core/widgets/author_card.dart';

class AuthorsView extends StatefulWidget {
  const AuthorsView({super.key, required this.authors});
  final List<Author> authors;
  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView> {
  final scrollController = ScrollController();

  void _onScroll() {
    if (_isBottom) {
      pageNumberAuthor += 1;

      context
          .read<AdminHomeCubit>()
          .fetchAuthors(pageNumberAuthor); // Use AdminHomeCubit
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    // Trigger fetch slightly before reaching the absolute bottom

    return currentScroll >= (maxScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: widget.authors.length,
            itemBuilder: (context, index) {
              return AuthorCard(
                author: widget.authors[index],
                cardStyle: CardStyle.standard,
                onTap: () => _showAuthorDetails(context, widget.authors[index]),
              );
            },
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  void _showAuthorDetails(BuildContext context, Author author) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("fullName"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (author.nationality != null)
              Text('Nationality: ${author.nationality}'),
            if (author.createdAt != null) Text('Created: ${author.createdAt}'),
            Text('ID: ${author.id ?? 'N/A'}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
