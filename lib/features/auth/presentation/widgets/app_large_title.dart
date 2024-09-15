import 'package:flutter/material.dart';

class AppLargeTitle extends StatelessWidget {
  const AppLargeTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              height: 1.5,
            ),
      ),
    );
  }
}
