part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

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
