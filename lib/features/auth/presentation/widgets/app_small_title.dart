import 'package:flutter/material.dart';

class AppSmallTitle extends StatelessWidget {
  const AppSmallTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              height: 1.5,
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}
