import 'package:house_of_electricity/src/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepo implements AuthRepo {
  final GoTrueClient _authClient;

  SupabaseAuthRepo({required GoTrueClient authClient})
    : _authClient = authClient;

  @override
  Future<bool> isLoggedIn() async {
    // try {
    //   await _authClient.refreshSession();
    // } catch (e) {
    //   await _authClient.signOut();
    // }

    if (_authClient.currentSession != null) {
      return true;
    }
    return false;
  }

  @override
  Future<void> logInAnonymously() async {
    await _authClient.signInAnonymously();
  }
}
