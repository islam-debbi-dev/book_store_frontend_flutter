part of 'admin_home_cubit.dart';

// Define separate statuses for clarity
enum DataStatus { initial, loading, success, error }

class AdminHomeState extends Equatable {
  // Book related state
  final DataStatus bookStatus;
  final List<Book> books;
  final String bookErrorMessage;

  // Author related state
  final DataStatus authorStatus;
  final List<Author> authors;
  final bool hasReachedMaxAuthors;
  final String authorErrorMessage;

  // filter authors
  final DataStatus filterAuthorStatus;
  final List<Author> filterAuthors;
  final String filterAuthorErrorMessage;

  const AdminHomeState({
    // Book defaults
    this.bookStatus = DataStatus.initial,
    this.books = const <Book>[],
    this.bookErrorMessage = '',
    // Author defaults
    this.authorStatus = DataStatus.initial,
    this.authors = const <Author>[],
    this.hasReachedMaxAuthors = false,
    this.authorErrorMessage = '',
    // filter authors
    this.filterAuthorStatus = DataStatus.initial,
    this.filterAuthors = const <Author>[],
    this.filterAuthorErrorMessage = '',
  });

  AdminHomeState copyWith({
    DataStatus? bookStatus,
    List<Book>? books,
    String? bookErrorMessage,
    DataStatus? authorStatus,
    List<Author>? authors,
    bool? hasReachedMaxAuthors,
    String? authorErrorMessage,
  }) {
    return AdminHomeState(
      bookStatus: bookStatus ?? this.bookStatus,
      books: books ?? this.books,
      bookErrorMessage: bookErrorMessage ?? this.bookErrorMessage,
      authorStatus: authorStatus ?? this.authorStatus,
      authors: authors ?? this.authors,
      hasReachedMaxAuthors: hasReachedMaxAuthors ?? this.hasReachedMaxAuthors,
      authorErrorMessage: authorErrorMessage ?? this.authorErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        bookStatus, books, bookErrorMessage, // Book props
        authorStatus, authors, hasReachedMaxAuthors,
        authorErrorMessage, // Author props
      ];
}
