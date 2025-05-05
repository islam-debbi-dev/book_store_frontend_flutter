import 'package:booke_store/feattures/admin/adminhome/logic/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.books[index].title!,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Author: ${state.books[index].author?.firstName} ${state.books[index].author?.lastName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Text(
                    'Price: \$${state.books[index].price}',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            );

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
