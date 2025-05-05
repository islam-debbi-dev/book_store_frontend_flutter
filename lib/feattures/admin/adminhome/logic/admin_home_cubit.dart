import 'package:bloc/bloc.dart';
import 'package:booke_store/feattures/admin/adminhome/data/models/author.dart';
import 'package:booke_store/feattures/admin/adminhome/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../data/models/book.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  final HomeRepo homeRepo;
  AdminHomeCubit(this.homeRepo) : super(const AdminHomeState());

  // --- Book Fetching Logic ---
  Future<void> fetchBooks() async {
    emit(state.copyWith(bookStatus: DataStatus.loading));

    try {
      final books = await homeRepo.GetBooks();
      emit(state.copyWith(
        bookStatus: DataStatus.success,
        books: books,
      ));
    } catch (e) {
      emit(state.copyWith(
        bookStatus: DataStatus.error,
        bookErrorMessage: e.toString(),
      ));
    }
  }

  // --- Author Fetching Logic (Merged) ---
  Future<void> fetchAuthors(int pageNumber, [int authorsPerPage = 10]) async {
    // Prevent fetching if already loading or max reached
    if (state.authorStatus == DataStatus.loading || state.hasReachedMaxAuthors)
      return;

    // Set status to loading, keeping existing authors if not initial load
    emit(state.copyWith(authorStatus: DataStatus.loading));

    try {
      // Assuming GetAuthor fetches the *next* batch based on pageNumber
      final newAuthors = await homeRepo.GetAuthor(pageNumber, authorsPerPage);

      if (newAuthors.isEmpty) {
        emit(state.copyWith(
            authorStatus: DataStatus.success, hasReachedMaxAuthors: true));
      } else {
        // Append new authors to the existing list
        emit(state.copyWith(
          authorStatus: DataStatus.success,
          authors: List.of(state.authors)..addAll(newAuthors),
          hasReachedMaxAuthors: false, // Reset in case it was true before
        ));
      }
    } catch (e) {
      emit(state.copyWith(
          authorStatus: DataStatus.error, authorErrorMessage: e.toString()));
    }
  }
}
