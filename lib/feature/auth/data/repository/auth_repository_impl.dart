import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/either/either.dart';
import 'package:todo/core/errors/failure.dart';
import 'package:todo/feature/auth/data/datasource/auth_datasource.dart';
import 'package:todo/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, User?>> login(String email, String password) async {
    try {
      final data = await _remoteDataSource.signIn(email, password);
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> register(String email, String password) async {
    try {
      final data = await _remoteDataSource.signUp(email, password);

      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Either<Failure, User?> getCurrentUser() {
    try {
      final data = _remoteDataSource.getCurrentUser();
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
