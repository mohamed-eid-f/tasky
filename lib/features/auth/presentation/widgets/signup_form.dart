import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/widgets/app_large_title.dart';

import '../../../../core/presentation/widgets/app_button.dart';
import '../../domain/entity/app_user.dart';
import '../bloc/auth/auth_bloc.dart';
import 'app_dropdown_textfield.dart';
import 'app_password_field.dart';
import 'custom_text_field.dart';
import 'phone_text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? name,
      yearsOfExperience,
      address,
      password,
      experienceLevel,
      phoneNumber;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        height: bottomPadding > 0 ? 0.6 * height + bottomPadding : 500,
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              const AppLargeTitle(title: "Signup"),
              const SizedBox(height: 8.0),
              CustomTextField(
                label: "Name...",
                onSaved: (value) => name = value,
              ),
              const SizedBox(height: 8.0),
              PhoneTextField(
                focusNode: focusNode,
                onSaved: (value) {
                  phoneNumber = value!.completeNumber;
                },
              ),
              CustomTextField(
                label: "Years of Experience...",
                onSaved: (value) {
                  yearsOfExperience = value;
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 8.0),
              AppDropdownTextField(
                label: "Choose Experience Level",
                onSelected: (value) {
                  experienceLevel = value;
                },
              ),
              const SizedBox(height: 8.0),
              CustomTextField(
                label: "Address...",
                onSaved: (value) => address = value,
              ),
              const SizedBox(height: 8.0),
              AppPasswordField(
                label: "Password",
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 24.0),
              AppButton(
                title: "Sign up",
                onPressed: register,
              ),
            ],
          ),
        ),
      ),
    );
  }

  dynamic register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AppUser appUser = AppUser(
        phone: phoneNumber!,
        address: address!,
        displayName: name!,
        password: password!,
        experienceYears: int.parse(yearsOfExperience!),
        level: experienceLevel!,
      );
      context.read<AuthBloc>().add(RegisterUserEvent(appUser));
    }
  }
}
