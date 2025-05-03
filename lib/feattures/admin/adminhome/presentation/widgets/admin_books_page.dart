import 'package:booke_store/feattures/admin/adminhome/logic/admin_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBooksPage extends StatefulWidget {
  const AdminBooksPage({super.key});
  @override
  State<AdminBooksPage> createState() => _AdminBooksPageState();
}

@override
void initState(BuildContext context) {}

class _AdminBooksPageState extends State<AdminBooksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminHomeCubit, AdminHomeState>(
      builder: (context, state) {
        if (state is GetBooksSuccess) {
          return ListView.builder(
            itemCount: state.book.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.book[index].title!,
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  'Author: ${state.book[index].author?.firstName} ${state.book[index].author?.lastName}',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Text(
                  'Price: \$${state.book[index].price}',
                  style: TextStyle(fontSize: 16),
                ),
              );
            },
          );
        } else if (state is GetBooksLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetBooksFailure) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
      listener: (BuildContext context, state) {
        if (state is GetBooksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
    );
  }
}
