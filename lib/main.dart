import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tasky/core/theme/app_theme.dart';
import 'package:tasky/features/task/presentation/bloc/all_todos/all_todos_bloc.dart';
import 'package:tasky/features/task/presentation/bloc/todos/todos_bloc.dart';
import 'core/presentation/bloc/bloc_observer.dart';
import 'core/presentation/pages/splash_screen.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();

  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(create: (context) => di.sl<TodosBloc>()),
        BlocProvider(create: (context) => di.sl<AllTodosBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasky',
        theme: appThemeData,
        home: const SplashScreen(),
      ),
    );
  }
}
