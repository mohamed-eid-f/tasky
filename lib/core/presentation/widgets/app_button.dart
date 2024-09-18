import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.iconPath,
    this.isLoading = false,
  });

  final String title;
  final Function()? onPressed;
  final String? iconPath;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Colors.white,
                              ),
                    ),
                    if (iconPath != null) const SizedBox(width: 16),
                    if (iconPath != null) Image.asset(iconPath!),
                  ],
                ),
        ),
      ),
    );
  }
}
