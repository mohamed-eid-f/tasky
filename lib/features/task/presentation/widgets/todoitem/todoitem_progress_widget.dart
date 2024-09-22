import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/todo_status_enum.dart';

class TodoStatusWidget extends StatelessWidget {
  const TodoStatusWidget({
    super.key,
    required this.status,
  });
  final String status;

  @override
  Widget build(BuildContext context) {
    TodoStatusEnum todoProgressEnum = switch (status) {
      'finished' => TodoStatusEnum.finished,
      'inProgress' => TodoStatusEnum.inProgress,
      'waiting' => TodoStatusEnum.waiting,
      _ => TodoStatusEnum.waiting,
    };
    return Chip(
      label: Text(
        todoProgressEnum.name,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: todoProgressEnum.foregroundColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // padding: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      backgroundColor: todoProgressEnum.backgroundColor,
    );
  }
}
