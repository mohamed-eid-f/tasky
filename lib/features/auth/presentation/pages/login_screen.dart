import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';
import 'package:tasky/features/auth/presentation/widgets/app_custom_rich_text.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';
import 'package:tasky/features/auth/presentation/widgets/app_password_field.dart';
import 'package:tasky/features/auth/presentation/widgets/phone_text_field.dart';

import '../../../task/presentation/pages/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kOnboardingImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              // height: 600,
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const AppLargeTitle(title: "Login"),
                    const SizedBox(height: 8.0),
                    PhoneTextField(focusNode: focusNode),
                    const SizedBox(height: 8.0),
                    AppPasswordField(
                      controller: TextEditingController(),
                      label: "Password",
                    ),
                    const SizedBox(height: 24.0),
                    AppButton(
                      title: "Login",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8.0),
                    AppCustomRichText(
                      text_1: "Don't have an account? ",
                      text_2: "Sign up",
                      onTap_2: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
