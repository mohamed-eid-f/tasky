import 'package:flutter/material.dart';
import 'package:tasky/core/consts/app_colors.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const AddNewTaskScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
