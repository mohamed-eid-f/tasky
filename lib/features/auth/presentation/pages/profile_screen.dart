import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/presentation/widgets/app_error_widget.dart';
import 'package:tasky/core/presentation/widgets/loading_widget.dart';

import 'package:tasky/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:tasky/features/auth/presentation/widgets/profile_information.dart';

import '../../../../core/presentation/widgets/custom_add_new_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(RefreshTokenEvent());
    context.read<AuthBloc>().add(GetProfileEvent());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomAppbar(
                title: "Profile",
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is GetProfileSuccessState) {
                        return ProfileInformation(user: state.user);
                      } else if (state is AuthErrorState) {
                        return AppErrorWidget(
                          state.errorMessage,
                          onPressed: () {
                            context.read<AuthBloc>().add(GetProfileEvent());
                          },
                        );
                      }
                      return const LoadingWidget();
                    },
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
