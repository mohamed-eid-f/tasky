import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';
import 'package:tasky/features/auth/presentation/widgets/app_small_title.dart';
import 'package:tasky/features/auth/presentation/widgets/custom_text_field_hint.dart';
import 'package:tasky/features/task/data/models/todo_model.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';
import 'package:tasky/features/task/presentation/widgets/add_img_button.dart';
import 'package:tasky/features/task/presentation/widgets/custom_date_selector.dart';
import 'package:tasky/features/task/presentation/widgets/custom_priority_selector.dart';

import '../bloc/todos/todos_bloc.dart';

class AddNewTaskWidget extends StatelessWidget {
  const AddNewTaskWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const AddImgButton(),
        const SizedBox(height: 16),
        const AppSmallTitle(title: "Task title"),
        const SizedBox(height: 16),
        CustomTextFieldHint(
          hint: "Enter Title here...",
          controller: titleController,
        ),
        const SizedBox(height: 16),
        const AppSmallTitle(title: "Task Description"),
        const SizedBox(height: 16),
        CustomTextFieldHint(
          hint: "Enter Description here...",
          lines: 6,
          controller: descriptionController,
        ),
        const SizedBox(height: 16),
        const AppSmallTitle(title: "Priority"),
        const SizedBox(height: 16),
        const CustomPrioritySelector(),
        const SizedBox(height: 16),
        const AppSmallTitle(title: "Due Date"),
        const SizedBox(height: 16),
        const CustomDatePicker(
          titleText: "choose due date...",
        ),
        const SizedBox(height: 24),
        AppButton(
          title: "Add task",
          onPressed: () async {
            TodoModel todo = TodoModel();
            todo.title = "first todo title from app"; // titleController.text;
            todo.desc =
                "test description test description"; // descriptionController.text;
            todo.dueDate = ""; // todoDueDate;
            todo.priority = todoPriority;

            if (todoImg == null) {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        title: Text("Please select an image"),
                      ));
            }
            todo.image = todoImg;
            // context.read<AuthBloc>().add(RefreshTokenEvent());
            context
                .read<TodosBloc>()
                .add(CreateTodoEvent(todo: todo, imgPath: todoImg!));
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
