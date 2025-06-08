import 'package:bloc/bloc.dart';
import 'package:booke_store/features/admin/adminhome/data/models/author.dart';
import 'package:booke_store/features/admin/adminhome/data/repo/home_repo.dart';
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
      books.when(success: (data) {
        emit(state.copyWith(
          bookStatus: DataStatus.success,
          books: data,
          isFiltered: false,
        ));
      }, failure: (error) {
        emit(state.copyWith(
          bookStatus: DataStatus.error,
          bookErrorMessage: error.apiErrorModel.message ?? '',
          isFiltered: false,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        bookStatus: DataStatus.error,
        bookErrorMessage: e.toString(),
        isFiltered: false,
      ));
    }
  }

  // filter books
  Future<void> filterBooks(int minPrice, int maxPrice) async {
    emit(state.copyWith(bookStatus: DataStatus.loading));

    try {
      final books = await homeRepo.filterBooks(minPrice, maxPrice);
      books.when(success: (data) {
        emit(state.copyWith(
          bookStatus: DataStatus.success,
          filteredBooks: data,
          isFiltered: true,
        ));
      }, failure: (error) {
        emit(state.copyWith(
          bookStatus: DataStatus.error,
          filterBookErrorMessage: error.apiErrorModel.message ?? '',
          isFiltered: false,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        bookStatus: DataStatus.error,
        filterBookErrorMessage: e.toString(),
        isFiltered: false,
      ));
    }
  }

  // --- Author Fetching Logic (Merged) ---
  Future<void> fetchAuthors(int pageNumber, [int authorsPerPage = 6]) async {
    // Prevent fetching if already loading or max reached
    if (state.authorStatus == DataStatus.loading ||
        state.hasReachedMaxAuthors) {
      return;
    }

    // Set status to loading, keeping existing authors if not initial load
    emit(state.copyWith(authorStatus: DataStatus.loading));

    // Assuming GetAuthor fetches the *next* batch based on pageNumber
    final newAuthors = await homeRepo.GetAuthor(pageNumber, authorsPerPage);
    newAuthors.when(success: (data) {
      if (data.isEmpty) {
        emit(state.copyWith(
            authorStatus: DataStatus.success, hasReachedMaxAuthors: true));
      } else {
        // Append new authors to the existing list
        emit(state.copyWith(
          authorStatus: DataStatus.success,
          authors: List.of(state.authors)..addAll(data),
          hasReachedMaxAuthors: false, // Reset in case it was true before
        ));
      }
    }, failure: (error) {
      emit(state.copyWith(
          authorStatus: DataStatus.error,
          authorErrorMessage: error.apiErrorModel.message ?? ''));
    });
  }
}
