import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tasky/features/auth/data/repos/user_repo_impl.dart';
import 'package:tasky/features/auth/domain/repos/user_repo.dart';
import 'package:tasky/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/login_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/refresh_token_usecase.dart';

import 'core/network/internet_info.dart';
import 'features/auth/data/datasources/user_data_source.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! feature: auth

  // Bloc
  sl.registerFactory(() => AuthBloc(
        createUserUsecase: sl(),
        getAppUserUsecase: sl(),
        loginUsecase: sl(),
        logoutUsecase: sl(),
        refreshTokenUsecase: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => CreateUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetAppUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUsecase(repository: sl()));
  sl.registerLazySingleton(() => RefreshTokenUsecase(repository: sl()));

  // Repository
  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      userDataSource: sl(),
      internetInfo: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<UserDataSource>(
      () => UserDataSourceWithHttp(client: sl()));

  //! CORE
  sl.registerLazySingleton<InternetInfo>(
      () => InternetInfoImp(connectionChecker: sl()));

  //! EXTERNAL
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
