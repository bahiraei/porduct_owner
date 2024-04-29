part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashSuccess extends SplashState {
  const SplashSuccess();

  @override
  List<Object?> get props => [];
}

class SplashError extends SplashState {
  final AppException exception;

  const SplashError({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}
