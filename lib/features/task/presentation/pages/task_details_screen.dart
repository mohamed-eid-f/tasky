import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../auth/presentation/widgets/app_large_title.dart';
import '../../../auth/presentation/widgets/app_small_title.dart';
import '../widgets/custom_date_selector.dart';
import '../widgets/custom_details_appbar.dart';
import '../widgets/custom_priority_selector.dart';
import '../widgets/custom_progress_selector.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomDetailsAppbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 225,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Image.asset(
                          'assets/images/list_image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const AppLargeTitle(title: "Grocery Shopping App"),
                      const AppSmallTitle(
                          title:
                              "This application is designed for super shops. By using this application they can enlist all their products in one place and can deliver. Customers will get a one-stop solution for their daily shopping."),
                      const SizedBox(height: 16),
                      const CustomDatePicker(
                        titleText: "30 June 2022",
                        subTitleText: "End Date",
                        backgroundColor: AppColors.secondary,
                      ),
                      const SizedBox(height: 8),
                      const CustomProgressSelector(),
                      const SizedBox(height: 8),
                      const CustomPrioritySelector(),
                      const SizedBox(height: 16),
                      Image.asset(
                        'assets/images/qr.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
