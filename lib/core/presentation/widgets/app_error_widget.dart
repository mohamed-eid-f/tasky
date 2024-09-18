import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';
import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(32),
        color: Colors.redAccent,
        // height: MediaQuery.of(context).size.height / 3,
        width: 300,
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
                title: "Try Again",
                onPressed: () {
                  context.read<AuthBloc>().add(InitialEvent());
                }),
          ],
        ),
      ),
    );
  }
}
