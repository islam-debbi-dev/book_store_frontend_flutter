import 'package:flutter/material.dart';

import '../../../../../core/widgets/book_card.dart';
import '../../data/models/book.dart';

class BooksView extends StatefulWidget {
  const BooksView({super.key, required this.books});
  final List<Book> books;
  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  late List<Book> books;

  @override
  void initState() {
    super.initState();
    books = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Grid Layout
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(
                  data: books[index],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped: ${books[index].title}'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
