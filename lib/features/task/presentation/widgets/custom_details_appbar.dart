import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';

class CustomDetailsAppbar extends StatelessWidget {
  const CustomDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/icons/arrow_left.png"),
        ),
        const SizedBox(width: 16.0),
        const AppLargeTitle(title: "Task Details"),
        const Spacer(),
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text("Edit"),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
          offset: const Offset(0, 40),
          color: Colors.white,
          elevation: 4,
          onSelected: (value) {
            if (value == 1) {
            } else if (value == 2) {}
          },
        ),
      ],
    );
  }
}
