import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';

enum TodoStatusEnum {
  all(
      name: "All",
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.primary),
  inProgress(
      name: "InProgress",
      backgroundColor: AppColors.inProgressBg,
      foregroundColor: AppColors.inProgress),
  waiting(
      name: "Waiting",
      backgroundColor: AppColors.waitingBg,
      foregroundColor: AppColors.waiting),
  finished(
      name: "Finished",
      backgroundColor: AppColors.finishedBg,
      foregroundColor: AppColors.finished);

  final String name;
  final Color backgroundColor;
  final Color foregroundColor;

  const TodoStatusEnum({
    required this.name,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}
