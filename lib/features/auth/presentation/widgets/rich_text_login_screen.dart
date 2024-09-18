import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/pages/signup_screen.dart';
import 'package:tasky/features/auth/presentation/widgets/app_custom_rich_text.dart';

class RichTextLoginScreen extends StatelessWidget {
  const RichTextLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomRichText(
      text_1: "Don't have an account? ",
      text_2: "Sign up",
      onTap_2: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const SignupScreen(),
          ),
        );
      },
    );
  }
}
