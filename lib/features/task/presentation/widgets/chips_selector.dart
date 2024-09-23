import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/task/domain/enum/todo_status_enum.dart';

import '../../../../core/consts/app_colors.dart';
import '../bloc/all_todos/all_todos_bloc.dart';

class ChipsSelector extends StatefulWidget {
  const ChipsSelector({super.key});

  @override
  State<ChipsSelector> createState() => _ChipsSelectorState();
}

class _ChipsSelectorState extends State<ChipsSelector> {
  TodoStatusEnum _value = TodoStatusEnum.values[0];
  @override
  Widget build(BuildContext context) {
    if (_value == TodoStatusEnum.inProgress) {
      context.read<AllTodosBloc>().add(const GetAllTodosEvent("inProgress"));
    } else if (_value == TodoStatusEnum.waiting) {
      context.read<AllTodosBloc>().add(const GetAllTodosEvent("waiting"));
    } else if (_value == TodoStatusEnum.finished) {
      context.read<AllTodosBloc>().add(const GetAllTodosEvent("finished"));
    } else {
      context.read<AllTodosBloc>().add(const GetAllTodosEvent("all"));
    }
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
                  if (selected && _value != todoType) {
                    _value = todoType;
                    setState(() {});
                  }
                },
              ));
        });
  }
}
