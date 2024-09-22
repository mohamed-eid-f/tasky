import 'package:flutter/material.dart';
import 'package:tasky/core/consts/app_colors.dart';
import 'package:tasky/core/consts/consts.dart';
import 'package:intl/intl.dart';
import 'package:tasky/features/task/presentation/pages/add_new_task_screen.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    required this.titleText,
    this.subTitleText,
    this.backgroundColor,
  });

  final String titleText;
  final String? subTitleText;
  final Color? backgroundColor;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Future selectDate(BuildContext context) async => showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
        ).then((DateTime? selected) {
          if (selected != null && selected != selectedDate) {
            setState(() {
              selectedDate = selected;
              // 2024-05-15
              todoDueDate = DateFormat('yyyy-MM-dd').format(selectedDate);
            });
          }
        });

    return InkWell(
      onTap: () => selectDate(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(
            width: widget.backgroundColor == null ? 1 : 0,
            color: widget.backgroundColor == null
                ? AppColors.grey
                : Colors.transparent,
          ),
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 24,
            vertical: 8,
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.subTitleText != null)
                    Text(
                      widget.subTitleText!,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 9,
                      ),
                    ),
                  Text(
                    DateFormat('dd MMM, yyyy').format(selectedDate),
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/calendar.png',
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
