import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> signUp({required String email, required String password, String? name}) async {
    final user = await remoteDataSource.signUp(email: email, password: password, name: name);
    return _mapToEntity(user);
  }

  @override
  Future<UserEntity> login({required String email, required String password}) async {
    final user = await remoteDataSource.login(email: email, password: password);
    return _mapToEntity(user);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = remoteDataSource.getCurrentUser();
    return user != null ? _mapToEntity(user) : null;
  }

  @override
  Stream<UserEntity?> get user {
    return remoteDataSource.authStateChanges.map((state) {
      final user = state.session?.user;
      return user != null ? _mapToEntity(user) : null;
    });
  }

  UserEntity _mapToEntity(User user) {
    return UserEntity(
      id: user.id,
      email: user.email ?? '',
      name: user.userMetadata?['full_name'],
    );
  }
}
