import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tasky/core/consts/consts.dart';

import '../../domain/enum/todo_status_enum.dart';

class ChooseStatusWidget extends StatelessWidget {
  const ChooseStatusWidget({
    super.key,
    required this.status,
    this.isSelectable = false,
  });

  final TodoStatusEnum status;
  final bool isSelectable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: status.backgroundColor,
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
            status.name,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: status.foregroundColor,
                ),
          ),
          const Spacer(),
          if (!isSelectable)
            Icon(
              IconlyBold.arrow_down_2,
              color: status.foregroundColor,
            ),
        ],
      ),
    );
  }
}
