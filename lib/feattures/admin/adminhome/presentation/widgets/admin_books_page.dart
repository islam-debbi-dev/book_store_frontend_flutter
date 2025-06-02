import 'package:booke_store/feattures/admin/adminhome/logic/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_view.dart';

class AdminBooksPage extends StatefulWidget {
  const AdminBooksPage({super.key});
  @override
  State<AdminBooksPage> createState() => _AdminBooksPageState();
}

class _AdminBooksPageState extends State<AdminBooksPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdminHomeCubit>(context).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        switch (state.bookStatus) {
          case DataStatus.success:
            return BooksView(books: state.books);

          case DataStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case DataStatus.error:
            return Center(
              child: Text(
                  'Failed to load books: ${state.bookErrorMessage ?? 'Unknown error'}',
                  style: const TextStyle(color: Colors.red)),
            );
          case DataStatus.initial:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
        }
      },
      listener: (BuildContext context, state) {
        if (DataStatus.error == state.bookStatus) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.bookErrorMessage}')),
          );
        }
      },
    );
  }
}
