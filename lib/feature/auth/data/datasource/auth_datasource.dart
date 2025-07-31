import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password);
  User? getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      throw "AuthRemoteDataSourceImpl.signIn() Functionida xatolik bor";
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      throw "AuthRemoteDataSourceImpl.signUp() Functionida xatolik bor";
    }
  }

  @override
  User? getCurrentUser() => _firebaseAuth.currentUser;
}
