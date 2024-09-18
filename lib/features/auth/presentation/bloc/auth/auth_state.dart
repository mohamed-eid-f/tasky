part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class InitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final String successMessage;

  const LoginSuccessState(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class LogoutSuccessState extends AuthState {
  final String successMessage;

  const LogoutSuccessState(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class RefreshTokenSuccessState extends AuthState {
  final String successMessage;

  const RefreshTokenSuccessState(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class RegisterSuccessState extends AuthState {
  final String successMessage;

  const RegisterSuccessState(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

final class AuthProfileSuccessState extends AuthState {
  final AppUser user;
  const AuthProfileSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

final class AuthErrorState extends AuthState {
  final String errorMessage;

  const AuthErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
