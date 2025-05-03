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
