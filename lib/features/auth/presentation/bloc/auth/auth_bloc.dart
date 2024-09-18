import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasky/features/auth/domain/entity/app_user.dart';

import '../../../../../core/consts/consts.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/create_user_usecase.dart';
import '../../../domain/usecases/get_user_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/refresh_token_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetAppUserUsecase _getAppUserUsecase;
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final CreateUserUsecase _createUserUsecase;
  final RefreshTokenUsecase _refreshTokenUsecase;

  AuthBloc({
    required GetAppUserUsecase getAppUserUsecase,
    required LoginUsecase loginUsecase,
    required LogoutUsecase logoutUsecase,
    required CreateUserUsecase createUserUsecase,
    required RefreshTokenUsecase refreshTokenUsecase,
  })  : _refreshTokenUsecase = refreshTokenUsecase,
        _createUserUsecase = createUserUsecase,
        _logoutUsecase = logoutUsecase,
        _loginUsecase = loginUsecase,
        _getAppUserUsecase = getAppUserUsecase,
        super(InitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetUserEvent) {
        emit(AuthLoadingState());

        final either = await _getAppUserUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (user) => AuthProfileSuccessState(user: user),
        ));
      } else if (event is CreateUserEvent) {
        emit(AuthLoadingState());
        final either = await _createUserUsecase.call(event.user);
        emit(_getState(either));
      } else if (event is LoginEvent) {
        emit(AuthLoadingState());
        final either = await _loginUsecase.call(event.phone, event.password);
        emit(_getState(either));
      } else if (event is LogoutEvent) {
        emit(AuthLoadingState());
        final either = await _logoutUsecase.call();
        emit(_getState(either));
      } else if (event is RefreshTokenEvent) {
        emit(AuthLoadingState());
        final either = await _refreshTokenUsecase.call();
        emit(_getState(either));
      }
    });
  }
}

AuthState _getState(Either<Failure, String> either) {
  return either.fold(
    (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
    (_) => const AuthSuccessState(kSuccess),
  );
}

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure():
      return kServerFailureMessage;
    case OfflineFailure():
      return kOfflineFailureMessage;
    case NotFoundFailure():
      return kEmptyFailureMessage;
    default:
      return "Unexpected Error ($failure). Please try again later";
  }
}
