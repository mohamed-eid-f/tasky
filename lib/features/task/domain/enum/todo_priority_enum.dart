import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';

enum TodoPriorityEnum {
  high(
    name: "High",
    color: AppColors.highPriority,
    bgColor: AppColors.highPriorityBg,
  ),
  medium(
    name: "Medium",
    color: AppColors.mediumPriority,
    bgColor: AppColors.mediumPriorityBg,
  ),
  low(
    name: "Low",
    color: AppColors.lowPriority,
    bgColor: AppColors.lowPriorityBg,
  );

  final String name;
  final Color color;
  final Color bgColor;

  const TodoPriorityEnum({
    required this.name,
    required this.color,
    required this.bgColor,
  });
}
