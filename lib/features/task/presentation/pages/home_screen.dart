import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/pages/login_screen.dart';
import 'package:tasky/features/auth/presentation/widgets/app_small_title.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';
import 'package:tasky/features/task/presentation/widgets/custom_home_appbar.dart';
import 'package:tasky/features/task/presentation/widgets/taskitem/task_item.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/consts.dart';
import '../../../../core/storage/secure_storage.dart';
import '../widgets/chips_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          }
        },
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomHomeAppbar(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: AppSmallTitle(title: "My Tasks"),
            ),
            const SizedBox(height: 56, child: ChipsSelector()),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TaskItem();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {},
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.primary,
            child: const Icon(Icons.qr_code),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddNewTaskScreen()));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
