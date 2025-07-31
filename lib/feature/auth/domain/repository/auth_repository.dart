import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/either/either.dart';
import 'package:todo/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> login(String email, String password);
  Future<Either<Failure, User?>> register(String email, String password);
  Either<Failure, User?> getCurrentUser();
}
