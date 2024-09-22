import 'package:flutter/material.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';
import 'package:tasky/features/task/presentation/widgets/choose_priority_widget.dart';

import '../../../../core/consts/consts.dart';
import '../../../auth/presentation/widgets/app_large_title.dart';
import '../../domain/enum/todo_priority_enum.dart';

class CustomPrioritySelector extends StatefulWidget {
  const CustomPrioritySelector({this.priority, super.key});
  final String? priority;
  @override
  State<CustomPrioritySelector> createState() => _CustomPrioritySelectorState();
}

class _CustomPrioritySelectorState extends State<CustomPrioritySelector> {
  TodoPriorityEnum selectedTodoPriority = TodoPriorityEnum.low;

  @override
  void initState() {
    super.initState();
    if (widget.priority != null) {
      switch (widget.priority!.toLowerCase()) {
        case 'medium':
          selectedTodoPriority = TodoPriorityEnum.medium;
          break;

        case 'high':
          selectedTodoPriority = TodoPriorityEnum.high;
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Dialog selectDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)), //this right here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLargeTitle(title: "Select Todo Priority"),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    TodoPriorityEnum selectedPriority =
                        TodoPriorityEnum.values[index];
                    setState(() {
                      selectedTodoPriority = selectedPriority;
                      todoPriority = selectedPriority.name.toLowerCase();
                    });
                  },
                  child: ChoosePriorityWidget(
                    priority: TodoPriorityEnum.values[index],
                    isSelectable: true,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: TodoPriorityEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
    return InkWell(
      onTap: () {
        showDialog(
            context: context, builder: (BuildContext context) => selectDialog);
      },
      child: ChoosePriorityWidget(
        priority: selectedTodoPriority,
      ),
    );
  }
}
