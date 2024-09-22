import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tasky/features/auth/data/repos/user_repo_impl.dart';
import 'package:tasky/features/auth/domain/repos/user_repo.dart';
import 'package:tasky/features/auth/domain/usecases/register_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/get_profile_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/login_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tasky/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:tasky/features/task/domain/repos/todo_repo.dart';
import 'package:tasky/features/task/domain/usecases/create_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/delete_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/edit_todo_usecase.dart';
import 'package:tasky/features/task/domain/usecases/get_all_todos_usecase.dart';
import 'package:tasky/features/task/domain/usecases/get_one_todo_usecase.dart';
import 'package:tasky/features/task/presentation/bloc/all_todos/all_todos_bloc.dart';

import 'core/network/internet_info.dart';
import 'features/auth/data/datasources/user_data_source.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/task/data/datasources/todo_data_source.dart';
import 'features/task/data/repos/todo_repo_impl.dart';
import 'features/task/presentation/bloc/todos/todos_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! feature: auth

  // Bloc
  sl.registerFactory(() => AuthBloc(
        registerUserUsecase: sl(),
        getProfileUsecase: sl(),
        loginUsecase: sl(),
        logoutUsecase: sl(),
        refreshTokenUsecase: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => RegisterUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetProfileUsecase(repository: sl()));
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

  //! feature: tasks

  // Bloc
  sl.registerFactory(() => AllTodosBloc(
        getAllTodosUsecase: sl(),
      ));
  sl.registerFactory(() => TodosBloc(
        createTodoUsecase: sl(),
        deleteTodoUsecase: sl(),
        getOneTodoUsecase: sl(),
        editTodoUsecase: sl(),
      ));

  // Usecases
  sl.registerLazySingleton(() => GetAllTodosUsecase(repository: sl()));
  sl.registerLazySingleton(() => CreateTodoUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeleteTodoUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetOneTodoUsecase(repository: sl()));
  sl.registerLazySingleton(() => EditTodoUsecase(repository: sl()));

  // Repository
  sl.registerLazySingleton<TodoRepo>(
    () => TodoRepoImpl(
      todoDataSource: sl(),
      internetInfo: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<TodoDataSource>(
      () => TodoDataSourceWithHttp(client: sl()));

  //! CORE
  sl.registerLazySingleton<InternetInfo>(
      () => InternetInfoImp(connectionChecker: sl()));

  //! EXTERNAL
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
