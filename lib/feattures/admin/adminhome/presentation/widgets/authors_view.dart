import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/constants.dart';
import '../../data/models/author.dart';
import '../../logic/admin_home_cubit.dart';
import '../../../../../core/widgets/author_card.dart';

class AuthorsView extends StatefulWidget {
  const AuthorsView({Key? key, required this.authors}) : super(key: key);
  final List<Author> authors;
  @override
  State<AuthorsView> createState() => _AuthorsViewState();
}

class _AuthorsViewState extends State<AuthorsView> {
  final scrollController = ScrollController();

  void _onScroll() {
    if (_isBottom) {
      pageNumberAuthor += 1;
      print('page number is : ${pageNumberAuthor}');

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
    print('page number is : ${pageNumberAuthor}');

    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Standard Cards Grid
          const Text(
            'Standard Cards',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
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

          // const SizedBox(height: 32),

          // // Compact Cards
          // const Text(
          //   'Compact Cards',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black87,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // ...widget.authors.map((author) => Padding(
          //       padding: const EdgeInsets.only(bottom: 8),
          //       child: AuthorCard(
          //         author: author,
          //         cardStyle: CardStyle.compact,
          //         width: double.infinity,
          //         onTap: () => _showAuthorDetails(context, author),
          //       ),
          //     )),

          // const SizedBox(height: 32),

          // Detailed Card
          // const Text(
          //   'Detailed Card',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black87,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // AuthorCard(
          //   author: widget.authors[1],
          //   cardStyle: CardStyle.detailed,
          //   width: double.infinity,
          //   showCreatedDate: true,
          //   onTap: () => _showAuthorDetails(context, widget.authors[0]),
          // ),

          // const SizedBox(height: 32),

          // Minimal Cards
          // const Text(
          //   'Minimal Cards',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black87,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     childAspectRatio: 1,
          //     crossAxisSpacing: 12,
          //     mainAxisSpacing: 12,
          //   ),
          //   itemCount: widget.authors.length,
          //   itemBuilder: (context, index) {
          //     return AuthorCard(
          //       author: widget.authors[index],
          //       cardStyle: CardStyle.minimal,
          //       onTap: () => _showAuthorDetails(context, widget.authors[index]),
          //     );
          //   },
          // ),
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
