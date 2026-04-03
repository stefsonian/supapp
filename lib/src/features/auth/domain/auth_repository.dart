abstract class AuthRepository {
  Stream<bool> get authStateChanges;
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
}
