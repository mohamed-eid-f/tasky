import 'package:flutter/material.dart';
import 'package:tasky/features/task/presentation/widgets/choose_priority_widget.dart';

import '../../../../core/consts/consts.dart';
import '../../../auth/presentation/widgets/app_large_title.dart';
import '../../domain/enum/task_priority_enum.dart';

class CustomPrioritySelector extends StatefulWidget {
  const CustomPrioritySelector({super.key});

  @override
  State<CustomPrioritySelector> createState() => _CustomPrioritySelectorState();
}

class _CustomPrioritySelectorState extends State<CustomPrioritySelector> {
  TaskPriorityEnum _selectedTaskPriority = TaskPriorityEnum.medium;
  @override
  Widget build(BuildContext context) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)), //this right here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLargeTitle(title: "Select Task Priority"),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectedTaskPriority = TaskPriorityEnum.values[index];
                    });
                  },
                  child: ChoosePriorityWidget(
                    priority: TaskPriorityEnum.values[index],
                    isSelectable: true,
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: TaskPriorityEnum.values.length,
              ),
            ),
          ],
        ),
      ),
    );
    return InkWell(
      onTap: () {
        showDialog(
            context: context, builder: (BuildContext context) => errorDialog);
      },
      child: ChoosePriorityWidget(
        priority: _selectedTaskPriority,
      ),
    );
  }
}
