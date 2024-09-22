import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/widgets/on_boarding_img_widget.dart';

import '../../../task/presentation/pages/home_screen.dart';
import '../widgets/login_form.dart';
import '../widgets/rich_text_login_screen.dart';

String? password, phoneNumber;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ));
                } else if (state is AuthLoadingState) {
                  showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                            title: Text('Information'),
                            content: Text('Loading...'),
                          ));
                  // showDialog(
                  //     context: context,
                  //     builder: (context) =>
                  //         const Center(child: LoadingWidget()));
                } else if (state is AuthErrorState) {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => AppErrorWidget(state.errorMessage));
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: const Text('Error'),
                            content: Text(state.errorMessage),
                          ));
                }
              },
              child: const Column(
                children: [
                  LoginForm(),
                  SizedBox(height: 8.0),
                  RichTextLoginScreen(),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
