import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/admin_home_cubit.dart';
import '../../../../../../core/widgets/book_card.dart';
import '../../../data/models/book.dart';
import '../search_field.dart';
import '../books_widgets/filter_books.dart';

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
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    books = widget.books;
    isFiltered = widget.isFiltered;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Book> get _filteredBooks {
    if (_searchText.isEmpty) return books;
    return books
        .where((book) => (book.title ?? '')
            .toLowerCase()
            .contains(_searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 16.0.h, left: 16.w, right: 16.w, bottom: 85.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(children: [
              SearchField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),
              FilterButton(context),
            ]),
          ),
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
              itemCount: _filteredBooks.length,
              itemBuilder: (context, index) {
                return BookCard(
                  data: _filteredBooks[index],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped: ${_filteredBooks[index].title}'),
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
