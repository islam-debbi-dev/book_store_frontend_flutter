class SharedPrefKeys {
  static const String userToken = 'userToken';
  static const String id = 'id';
  static const String email = 'email';
  static const String username = 'username';
  static const String isAdmin = 'isAdmin';
  bool isLoggedInUser = false;
}

int pageNumberAuthor = 1;
int pageNumberBook = 1;

clearPageNumbers() {
  pageNumberAuthor = 1;
  pageNumberBook = 1;
}
