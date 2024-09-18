import 'package:flutter/material.dart';
import 'package:tasky/core/consts/app_colors.dart';
import 'package:tasky/features/auth/domain/entity/app_user.dart';
import 'package:tasky/features/auth/presentation/widgets/profile_information_item.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.user,
  });

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 8;

    return Column(
      children: [
        ProfileInformationItem(
          subTitleText: "Name",
          titleText: user.displayName ?? "null",
        ),
        const SizedBox(height: sizedBoxHeight),
        ProfileInformationItem(
          subTitleText: "Phone",
          titleText: user.phone ?? "null",
          iconButton: IconButton(
              icon: const Icon(
                Icons.copy,
                color: AppColors.primary,
              ),
              onPressed: () {}),
        ),
        const SizedBox(height: sizedBoxHeight),
        ProfileInformationItem(
          subTitleText: "Level",
          titleText: user.level ?? "null",
        ),
        const SizedBox(height: sizedBoxHeight),
        ProfileInformationItem(
          subTitleText: "Years Of Experience",
          titleText: "${user.experienceYears} years",
        ),
        const SizedBox(height: sizedBoxHeight),
        ProfileInformationItem(
          subTitleText: "Location",
          titleText: user.address ?? "null",
        ),
      ],
    );
  }
}
