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
  GetAppUserUsecase getAppUserUsecase;
  LoginUsecase loginUsecase;
  LogoutUsecase logoutUsecase;
  CreateUserUsecase createUserUsecase;
  RefreshTokenUsecase refreshTokenUsecase;

  AuthBloc({
    required this.getAppUserUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.createUserUsecase,
    required this.refreshTokenUsecase,
  }) : super(AuthLoadingState()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthLoadingState());
      if (event is GetUserEvent) {
        final either = await getAppUserUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (user) => AuthProfileSuccessState(user: user),
        ));
      } else if (event is CreateUserEvent) {
        final either = await createUserUsecase.call(event.user);
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (_) => AuthSuccessState(),
        ));
      } else if (event is LoginEvent) {
        final either = await loginUsecase.call(event.phone, event.password);
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (_) => AuthSuccessState(),
        ));
      } else if (event is LogoutEvent) {
        final either = await logoutUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (_) => AuthSuccessState(),
        ));
      } else if (event is RefreshTokenEvent) {
        final either = await refreshTokenUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (_) => AuthSuccessState(),
        ));
      }
    });
  }
}

AuthState _getState(Either<Failure, AppUser> either) {
  return either.fold(
    (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
    (user) => AuthProfileSuccessState(user: user),
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
      return "Unexpected Error. Please try again later";
  }
}
