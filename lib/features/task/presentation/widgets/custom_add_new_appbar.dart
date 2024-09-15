import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
  });
  final String title;

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
        AppLargeTitle(title: title),
      ],
    );
  }
}
