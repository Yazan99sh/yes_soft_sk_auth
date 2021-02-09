import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefsHelper {
  Future<void> setUserId(String userId) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.setString('uid', userId);
    return;
  }

  Future<String> getUserId() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('uid');
  }

  Future<void> setUsername(String username) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.setString('username', username);
  }

  Future<String> getUsername() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('username');
  }

  Future<void> setEmail(String email) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.setString('email', email);
  }

  Future<String> getEmail() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('email');
  }

  Future<void> setPassword(String password) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.setString('password', password);
  }

  Future<String> getPassword() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('password');
  }

  Future<bool> isSignedIn() async {
    String uid = await getToken();
    return uid != null;
  }


  Future<void> setToken(String token) async {
    if (token == null) {
      return;
    }
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.setString(
      'token',
      token,
    );
    await preferencesHelper.setString(
        'token_date', DateTime.now().toIso8601String());
  }

  Future<String> getToken() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    var tokenDateString = preferencesHelper.getString('token_date');
    if (tokenDateString == null) {
      return null;
    }
    if (DateTime.parse(tokenDateString).difference(DateTime.now()) >
        Duration(minutes: 55)) {
      await preferencesHelper.remove('token');
      await preferencesHelper.remove('token_date');
      return null;
    }
    return preferencesHelper.getString('token');
  }

  Future<String> getTokenDate() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.get('token_date');
  }

  Future<void> clearPrefs() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.clear();
  }

}
