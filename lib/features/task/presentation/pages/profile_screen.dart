import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';
import '../widgets/custom_add_new_appbar.dart';
import '../widgets/profile_information_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 8;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomAppbar(title: "Profile"),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProfileInformationItem(
                        subTitleText: "Name",
                        titleText: "Islam Sayed",
                      ),
                      const SizedBox(height: sizedBoxHeight),
                      ProfileInformationItem(
                        subTitleText: "Phone",
                        titleText: "+20 123 456 7890",
                        iconButton: IconButton(
                            icon: const Icon(
                              Icons.copy,
                              color: AppColors.primary,
                            ),
                            onPressed: () {}),
                      ),
                      const SizedBox(height: sizedBoxHeight),
                      const ProfileInformationItem(
                        subTitleText: "Level",
                        titleText: "Senior",
                      ),
                      const SizedBox(height: sizedBoxHeight),
                      const ProfileInformationItem(
                        subTitleText: "Years Of Experience",
                        titleText: "7 years",
                      ),
                      const SizedBox(height: sizedBoxHeight),
                      const ProfileInformationItem(
                        subTitleText: "Location",
                        titleText: "Fayyum, Egypt",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
