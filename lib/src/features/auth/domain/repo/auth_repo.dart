abstract class AuthRepo {
  Future<bool> isLoggedIn();
  Future<void> logInAnonymously();
}
