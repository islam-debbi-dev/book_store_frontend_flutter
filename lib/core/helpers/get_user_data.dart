import 'constants.dart';
import 'shared_pref_helper.dart';
import '../../feattures/login/data/models/login_res.dart';

class GetUserData {
  Future<LoginRes> getUserDataFromStorage() async {
    // SharedPrefKeys
    final email = await SharedPrefHelper.getString(SharedPrefKeys.email);
    final username = await SharedPrefHelper.getString(SharedPrefKeys.username);
    final id = await SharedPrefHelper.getString(SharedPrefKeys.id);
    final isAdmin = await SharedPrefHelper.getBool(SharedPrefKeys.isAdmin);
    return LoginRes(email: email, username: username, isAdmin: isAdmin, id: id);
  }
}
