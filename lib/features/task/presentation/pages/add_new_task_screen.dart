import 'package:flutter/material.dart';
import 'package:tasky/core/presentation/widgets/app_button.dart';

import '../../../auth/presentation/widgets/app_small_title.dart';
import '../../../auth/presentation/widgets/custom_text_field_hint.dart';
import '../widgets/add_img_button.dart';
import '../widgets/custom_add_new_appbar.dart';
import '../widgets/custom_date_selector.dart';
import '../widgets/custom_priority_selector.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomAppbar(title: "Add New Task"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      AddImgButton(),
                      SizedBox(height: 16),
                      AppSmallTitle(title: "Task title"),
                      SizedBox(height: 16),
                      CustomTextFieldHint(
                        hint: "Enter Title here...",
                      ),
                      SizedBox(height: 16),
                      AppSmallTitle(title: "Task Description"),
                      SizedBox(height: 16),
                      CustomTextFieldHint(
                        hint: "Enter Description here...",
                        lines: 6,
                      ),
                      SizedBox(height: 16),
                      AppSmallTitle(title: "Priority"),
                      SizedBox(height: 16),
                      CustomPrioritySelector(),
                      SizedBox(height: 16),
                      AppSmallTitle(title: "Due Date"),
                      SizedBox(height: 16),
                      CustomDatePicker(
                        titleText: "choose due date...",
                      ),
                      SizedBox(height: 24),
                      AppButton(title: "Add task"),
                      SizedBox(height: 24),
                    ],
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
