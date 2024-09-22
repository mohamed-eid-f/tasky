import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/todo_status_enum.dart';

import '../../../../core/consts/app_colors.dart';

class ChipsSelector extends StatefulWidget {
  const ChipsSelector({super.key});

  @override
  State<ChipsSelector> createState() => _ChipsSelectorState();
}

class _ChipsSelectorState extends State<ChipsSelector> {
  TodoStatusEnum? _value = TodoStatusEnum.values[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: TodoStatusEnum.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final todoType = TodoStatusEnum.values[index];
          bool selected = _value == todoType;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ChoiceChip(
                label: Text(todoType.name),
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
                    _value = selected ? todoType : null;
                  });
                },
              ));
        });
  }
}
