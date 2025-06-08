const String baseUrl = 'http://192.168.1.16:8000/api/';
const String authLogin = 'auth/login';
const String authRegister = 'auth/register';
const String GetAllBooks = 'books';
const String GetAllAuthors = 'authors';
const String currentuser = 'users/current';
const String books = 'books';

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "check your internet connection";
  static const String defaultError = "Somtiong went wrong, try again!";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
