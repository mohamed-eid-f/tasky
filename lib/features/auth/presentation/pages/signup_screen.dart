import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/widgets/rich_text_signup_screen.dart';

import '../../../../core/presentation/widgets/app_error_widget.dart';
import '../../../../core/presentation/widgets/loading_widget.dart';
import '../../../task/presentation/pages/home_screen.dart';
import '../bloc/auth/auth_bloc.dart';
import '../widgets/on_boarding_img_widget.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // GlobalKey<FormState> _formKey = GlobalKey();

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
                if (state is RegisterSuccessState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ));
                }
              },
              builder: (context, state) {
                print("state: $state");
                if (state is AuthLoadingState) {
                  return const LoadingWidget();
                } else if (state is AuthErrorState) {
                  return AppErrorWidget(state.errorMessage);
                }
                return const Column(
                  children: [
                    SignupForm(),
                    SizedBox(height: 8),
                    RichTextSignupScreen(),
                    SizedBox(height: 8),
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
