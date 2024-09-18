import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/presentation/widgets/loading_widget.dart';
import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/widgets/on_boarding_img_widget.dart';

import '../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../task/presentation/pages/home_screen.dart';
import '../widgets/login_form.dart';
import '../widgets/rich_text_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: OnBoardingImgWidget(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const LoadingWidget();
                } else if (state is AuthErrorState) {
                  return AppErrorWidget(state.errorMessage);
                }
                return const Column(
                  children: [
                    LoginForm(),
                    SizedBox(height: 8.0),
                    RichTextLoginScreen(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
