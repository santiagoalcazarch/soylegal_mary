
abstract class PreferencesRepository{

  Future<void> setLoginState(bool isLoggedin);

  Future<void> clearLoginData();

  bool getLoginState();

  bool isInstanceConstainsKey();

}