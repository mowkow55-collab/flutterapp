import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp({required String email, required String password, String? name});
  Future<UserEntity> login({required String email, required String password});
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Stream<UserEntity?> get user;
}
