import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:tasky/features/task/domain/enum/task_priority_enum.dart';

class ChoosePriorityWidget extends StatelessWidget {
  const ChoosePriorityWidget({
    super.key,
    required this.priority,
    this.isSelectable = false,
  });

  final TaskPriorityEnum priority;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: priority.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius)),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.flag_outlined, color: priority.color),
          const SizedBox(width: 8),
          Text(
            "${priority.name} Priority",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: priority.color,
                ),
          ),
          const Spacer(),
          if (!isSelectable)
            Icon(
              IconlyBold.arrow_down_2,
              color: priority.color,
            ),
        ],
      ),
    );
  }
}
