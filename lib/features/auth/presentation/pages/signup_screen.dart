import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/widgets/rich_text_signup_screen.dart';

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
    final height = MediaQuery.of(context).size.height;

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
            child: Column(
              children: [
                const SignupForm(),
                SizedBox(height: height * 0.05),
                const RichTextSignupScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
