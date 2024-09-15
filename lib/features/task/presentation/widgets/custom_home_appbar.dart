import 'package:flutter/material.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';
import 'package:tasky/features/task/presentation/pages/profile_screen.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const AppLargeTitle(title: "Logo"),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
