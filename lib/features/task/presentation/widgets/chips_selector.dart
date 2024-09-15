import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/task_progress_enum.dart';

import '../../../../core/consts/app_colors.dart';

class ChipsSelector extends StatefulWidget {
  const ChipsSelector({super.key});

  @override
  State<ChipsSelector> createState() => _ChipsSelectorState();
}

class _ChipsSelectorState extends State<ChipsSelector> {
  TaskProgressEnum? _value = TaskProgressEnum.values[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: TaskProgressEnum.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final taskType = TaskProgressEnum.values[index];
          bool selected = _value == taskType;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ChoiceChip(
                label: Text(taskType.name),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                selected: selected,
                labelStyle: selected
                    ? const TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      )
                    : const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                onSelected: (selected) {
                  setState(() {
                    _value = selected ? taskType : null;
                  });
                },
              ));
        });
  }
}
