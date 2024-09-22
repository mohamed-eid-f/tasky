import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_button.dart';
import '../bloc/auth/auth_bloc.dart';
import '../pages/login_screen.dart';
import 'app_large_title.dart';
import 'app_password_field.dart';
import 'phone_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const AppLargeTitle(title: "Login"),
              const SizedBox(height: 8.0),
              PhoneTextField(
                focusNode: focusNode,
                initialValue: phoneNumber,
                onSaved: (value) {
                  phoneNumber = value!.completeNumber;
                },
              ),
              const SizedBox(height: 8.0),
              AppPasswordField(
                label: "Password",
                initialValue: password,
                onSaved: (value) => password = value,
              ),
              const SizedBox(height: 24.0),
              AppButton(
                title: "Login",
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();

                  context.read<AuthBloc>().add(const LoginEvent(
                        "+201129360508", //  phoneNumber!,
                        "123456", // password!,
                      ));
                  // } else {
                  //   print("Validation failed");
                  //   setState(() {
                  //     _autovalidateMode = AutovalidateMode.always;
                  //   });
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
