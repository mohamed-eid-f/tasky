part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends AuthEvent {}

class CreateUserEvent extends AuthEvent {
  final AppUser user;
  const CreateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  const LoginEvent(this.phone, this.password);
  @override
  List<Object> get props => [phone, password];
}

class LogoutEvent extends AuthEvent {}

class RefreshTokenEvent extends AuthEvent {}
