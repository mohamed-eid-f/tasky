import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';
import 'package:tasky/features/auth/presentation/widgets/app_custom_rich_text.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';
import 'package:tasky/features/auth/presentation/widgets/app_password_field.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:tasky/features/auth/presentation/widgets/phone_text_field.dart';

import '../../../task/presentation/pages/home_screen.dart';
import '../widgets/app_dropdown_textfield.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: height,
              width: width,
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
              height: 600 + bottomPadding,
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const AppLargeTitle(title: "Signup"),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      label: "Name...",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 8.0),
                    PhoneTextField(focusNode: focusNode),
                    CustomTextField(
                      label: "Years of Experience...",
                      controller: TextEditingController(),
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 8.0),
                    AppDropdownTextField(
                      label: "Choose Experience Level",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextField(
                      label: "Address...",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 8.0),
                    AppPasswordField(
                      controller: TextEditingController(),
                      label: "Password",
                    ),
                    const SizedBox(height: 24.0),
                    AppButton(
                      title: "Sign In",
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
                      text_1: "Already have an account? ",
                      text_2: "Sign in",
                      onTap_2: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8.0),
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
