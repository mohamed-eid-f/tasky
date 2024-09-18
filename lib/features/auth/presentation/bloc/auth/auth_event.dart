part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final AppUser user;
  const RegisterUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class InitialEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  const LoginEvent(this.phone, this.password);
  @override
  List<Object> get props => [phone, password];
}

class LogoutEvent extends AuthEvent {}

class RefreshTokenEvent extends AuthEvent {}
