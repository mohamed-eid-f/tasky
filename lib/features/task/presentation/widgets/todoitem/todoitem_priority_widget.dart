import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/todo_priority_enum.dart';

class TodoPriorityWidget extends StatelessWidget {
  const TodoPriorityWidget({
    super.key,
    required this.priority,
  });
  final String priority;

  @override
  Widget build(BuildContext context) {
    TodoPriorityEnum priorityEnum = switch (priority) {
      'high' => TodoPriorityEnum.high,
      'medium' => TodoPriorityEnum.medium,
      'low' => TodoPriorityEnum.low,
      _ => TodoPriorityEnum.low,
    };
    Color color = priorityEnum.color;
    return SizedBox(
      child: Row(
        children: [
          Icon(Icons.flag_outlined, color: color),
          const SizedBox(width: 8.0),
          Text(priorityEnum.name, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
