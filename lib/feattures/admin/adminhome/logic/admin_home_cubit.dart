import 'package:bloc/bloc.dart';
import 'package:booke_store/feattures/admin/adminhome/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../data/models/book.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  final HomeRepo homeRepo;
  AdminHomeCubit(this.homeRepo) : super(AdminHomeInitial());

  Future<void> fetchBooks() async {
    emit(GetBooksLoading());

    try {
      final books = await homeRepo.GetBooks();
      emit(GetBooksSuccess(books));
    } catch (e) {
      emit(GetBooksFailure(e.toString()));
    }
  }
}
