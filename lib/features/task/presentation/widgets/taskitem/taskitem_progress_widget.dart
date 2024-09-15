import 'package:flutter/material.dart';
import 'package:tasky/features/task/domain/enum/task_progress_enum.dart';

class TaskProgressWidget extends StatelessWidget {
  const TaskProgressWidget({
    super.key,
    required this.taskProgressEnum,
  });
  final TaskProgressEnum taskProgressEnum;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        taskProgressEnum.name,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: taskProgressEnum.foregroundColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // padding: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      backgroundColor: taskProgressEnum.backgroundColor,
    );
  }
}
