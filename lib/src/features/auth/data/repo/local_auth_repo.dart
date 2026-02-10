import 'package:house_of_electricity/src/features/auth/domain/repo/auth_repo.dart';

class LocalAuthRepo implements AuthRepo {
  @override
  Future<bool> isLoggedIn() {
    return Future.value(true);
  }

  @override
  Future<void> logInAnonymously() {
    return Future.value();
  }
}
