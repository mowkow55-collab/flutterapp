import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<User> signUp({required String email, required String password, String? name});
  Future<User> login({required String email, required String password});
  Future<void> logout();
  User? getCurrentUser();
  Stream<AuthState> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<User> signUp({required String email, required String password, String? name}) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: name != null ? {'full_name': name} : null,
    );
    if (response.user == null) {
      throw const AuthException('Sign up failed');
    }
    return response.user!;
  }

  @override
  Future<User> login({required String email, required String password}) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw const AuthException('Login failed');
    }
    return response.user!;
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  User? getCurrentUser() {
    return supabaseClient.auth.currentUser;
  }

  @override
  Stream<AuthState> get authStateChanges => supabaseClient.auth.onAuthStateChange;
}
