import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/core/consts/consts.dart';

import '../../domain/enum/task_progress_enum.dart';

class ChooseProgressWidget extends StatelessWidget {
  const ChooseProgressWidget({
    super.key,
    required this.progress,
    this.isSelectable = false,
  });

  final TaskProgressEnum progress;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: progress.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius)),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            progress.name,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: progress.foregroundColor,
                ),
          ),
          const Spacer(),
          if (!isSelectable)
            Icon(
              IconlyBold.arrow_down_2,
              color: progress.foregroundColor,
            ),
        ],
      ),
    );
  }
}
