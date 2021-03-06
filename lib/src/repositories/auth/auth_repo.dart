
abstract class AuthRepository{


  Future<void> signInWithCredentials(String email, String password);

  Future<void> signUp({String email, String password});

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<String> getUser();

}