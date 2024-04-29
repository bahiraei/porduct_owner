part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthError extends AuthState {
  final AppException exception;

  const AuthError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

final class AuthSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}
