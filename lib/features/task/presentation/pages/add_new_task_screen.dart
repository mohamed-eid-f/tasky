import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/task/presentation/bloc/todos/todos_bloc.dart';
import 'package:tasky/features/task/presentation/widgets/add_new_task_widget.dart';

import '../../../../core/presentation/widgets/custom_add_new_appbar.dart';
import '../../../../core/utils/show_dialog.dart';
import 'home_screen.dart';

String? todoImg;
String todoDueDate = "";
String todoPriority = "low";

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  late TextEditingController priorityController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
    priorityController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
    priorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomAppbar(title: "Add New Task"),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocListener<TodosBloc, TodosState>(
                    listener: (context, state) {
                      if (state is TodoSuccessState) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      } else if (state is TodoFailureState) {
                        ShowDialog(context).showErrorDialog(
                          message: state.message,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );
                      } else if (state is TodoLoadingState) {
                        ShowDialog(context).showLoadingDialog();
                      }
                    },
                    child: AddNewTaskWidget(
                      titleController: titleController,
                      descriptionController: descriptionController,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
