import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial()) {
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (_) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(email: email, password: password);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signUp({required String email, required String password, String? name}) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signUp(email: email, password: password, name: name);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await authRepository.logout();
    emit(AuthUnauthenticated());
  }
}
