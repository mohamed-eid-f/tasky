import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasky/features/auth/domain/entity/app_user.dart';

import '../../../../../core/consts/consts.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/usecases/get_profile_usecase.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/refresh_token_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetProfileUsecase getProfileUsecase;
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final RegisterUserUsecase registerUserUsecase;
  final RefreshTokenUsecase refreshTokenUsecase;

  AuthBloc({
    required this.getProfileUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.registerUserUsecase,
    required this.refreshTokenUsecase,
  }) : super(InitialState()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetProfileEvent) {
        emit(AuthLoadingState());

        final either = await getProfileUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (user) => GetProfileSuccessState(user: user),
        ));
      } else if (event is RegisterUserEvent) {
        emit(AuthLoadingState());
        final either = await registerUserUsecase.call(event.user);
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (success) => RegisterSuccessState(success),
        ));
      } else if (event is LoginEvent) {
        emit(AuthLoadingState());
        final either = await loginUsecase.call(event.phone, event.password);
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (success) => LoginSuccessState(success),
        ));
      } else if (event is InitialEvent) {
        emit(InitialState());
      } else if (event is LogoutEvent) {
        emit(AuthLoadingState());
        final either = await logoutUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (success) => LogoutSuccessState(success),
        ));
      } else if (event is RefreshTokenEvent) {
        emit(AuthLoadingState());
        final either = await refreshTokenUsecase.call();
        emit(either.fold(
          (failure) => AuthErrorState(errorMessage: getErrorMessage(failure)),
          (success) => RefreshTokenSuccessState(success),
        ));
      }
    });
  }
}

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure():
      return kServerFailureMessage;
    case OfflineFailure():
      return kOfflineFailureMessage;
    case NotFoundFailure():
      return kEmptyFailureMessage;
    case WrongFieldsFailure():
      return kWrongFieldFailureMessage;
    case UserExistFailure():
      return kUserExistFailureMessage;
    case WrongUserOrPasswordFailure():
      return kWrongUserOrPasswordFailureMessage;
    default:
      return "Unexpected Error ($failure). Please try again later";
  }
}
