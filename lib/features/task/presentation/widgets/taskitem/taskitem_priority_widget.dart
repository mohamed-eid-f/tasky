import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/task_priority_enum.dart';

class TaskPriorityWidget extends StatelessWidget {
  const TaskPriorityWidget({
    super.key,
    required this.priority,
  });
  final TaskPriorityEnum priority;

  @override
  Widget build(BuildContext context) {
    Color color = priority.color;
    return SizedBox(
      width: 80.0,
      child: Row(
        children: [
          Icon(Icons.flag_outlined, color: color),
          const SizedBox(width: 8.0),
          Text(priority.name, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
