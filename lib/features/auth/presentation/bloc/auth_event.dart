part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class AuthLoginWithPassStarted implements AuthEvent {
  final String username;
  final String password;

  AuthLoginWithPassStarted({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => throw UnimplementedError();
}
