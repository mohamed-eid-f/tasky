import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';

import '../../../features/task/presentation/pages/home_screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.widget,
  });
  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
          child: Image.asset("assets/icons/arrow_left.png"),
        ),
        const SizedBox(width: 16.0),
        AppLargeTitle(title: title),
        if (widget != null) const Spacer(),
        if (widget != null) widget!,
      ],
    );
  }
}
