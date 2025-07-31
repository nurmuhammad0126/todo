import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/local_datasource.dart';
import 'package:todo/feature/auth/domain/repository/auth_repository.dart';
import 'package:todo/feature/auth/data/datasource/auth_datasource.dart';
import 'package:todo/feature/auth/data/repository/auth_repository_impl.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRemoteDataSourceImpl(firebaseAuth);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<User?> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<User?> build() async {
    _authRepository = ref.read(authRepositoryProvider);

    final result = _authRepository.getCurrentUser();
    return result.right;
  }

  Future<void> login({
    required String email,
    required String password,
    required VoidCallback onSucces,
    required VoidCallback onFailure,
  }) async {
    state = const AsyncLoading();
    final result = await _authRepository.login(email, password);

    result.either(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        onFailure();
      },
      (user) async {
        if (user != null) {
          final token = await user.getIdToken();
          await SecureStorageService().saveToken(token!);
        }

        state = AsyncData(user);
        onSucces();
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required VoidCallback onSucces,
    required VoidCallback onFailure,
  }) async {
    state = const AsyncLoading();
    final result = await _authRepository.register(email, password);

    result.either(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        onFailure();
      },
      (user) {
        state = AsyncData(user);
        onSucces();
      },
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    state = const AsyncData(null);
  }
}
