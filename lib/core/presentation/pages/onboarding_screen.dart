import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/pages/login_screen.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';

import '../../consts/consts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Task Management &\n To-Do List",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "This productive tool is designed to help\nyou better manage your task \nproject-wise conveniently!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            AppButton(
              title: "Let's Start",
              iconPath: "assets/icons/arrow_right.png",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
