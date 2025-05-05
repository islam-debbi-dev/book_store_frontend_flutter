part of 'admin_home_cubit.dart';

@immutable
abstract class AdminHomeState {}

class AdminHomeInitial extends AdminHomeState {}

class GetBooksSuccess extends AdminHomeState {
  final List<Book> book;
  GetBooksSuccess(this.book);
}

class GetBooksLoading extends AdminHomeState {}

class GetBooksFailure extends AdminHomeState {
  final String error;
  GetBooksFailure(this.error);
}

// get authors
class GetAuthorsLoading extends AdminHomeState {}

class GetAuthorsSuccess extends AdminHomeState {
  final List<Author> newauthors;
  // save prev list and add new list for it
  List<Author> allauthors = [];

  GetAuthorsSuccess(this.newauthors) {
    allauthors.addAll(newauthors);
  }
}

class GetAuthorsFailure extends AdminHomeState {
  final String error;
  GetAuthorsFailure(this.error);
}
