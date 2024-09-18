import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/pages/login_screen.dart';
import 'package:tasky/features/auth/presentation/widgets/app_custom_rich_text.dart';

class RichTextSignupScreen extends StatelessWidget {
  const RichTextSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCustomRichText(
      text_1: "Already have an account? ",
      text_2: "Sign in",
      onTap_2: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }
}
