import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/admin_home_cubit.dart';
import '../../../../../../core/widgets/book_card.dart';
import '../../../data/models/book.dart';

class BooksView extends StatefulWidget {
  const BooksView({super.key, required this.books, required this.isFiltered});
  final List<Book> books;
  final bool isFiltered;

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  late List<Book> books;
  late bool isFiltered;
  @override
  void initState() {
    super.initState();
    books = widget.books;
    isFiltered = widget.isFiltered;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 16.0.h, left: 16.w, right: 16.w, bottom: 85.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isFiltered
              ? Container(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            BlocProvider.of<AdminHomeCubit>(context)
                                .fetchBooks();
                          }),
                      Text(
                        'All Books',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          fontSize: 20.sp,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
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
        ],
      ),
    );
  }
}
