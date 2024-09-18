import 'package:flutter/material.dart';
import 'package:tasky/core/consts/app_colors.dart';
import 'package:tasky/core/consts/consts.dart';

class ProfileInformationItem extends StatelessWidget {
  const ProfileInformationItem({
    super.key,
    required this.titleText,
    required this.subTitleText,
    this.iconButton,
  });

  final String titleText;
  final String subTitleText;
  final IconButton? iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      decoration: const BoxDecoration(
        color: AppColors.greyBg,
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 24,
          end: 8,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitleText.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.greyTxt,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  titleText,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const Spacer(),
            iconButton ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
