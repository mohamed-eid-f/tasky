import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_button.dart';
import '../../../task/presentation/pages/home_screen.dart';
import '../bloc/auth/auth_bloc.dart';
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
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? password, phoneNumber;

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
                onSaved: (value) {
                  phoneNumber = value!.completeNumber;
                },
              ),
              const SizedBox(height: 8.0),
              AppPasswordField(
                label: "Password",
                onSaved: (value) => password = value,
              ),
              const SizedBox(height: 24.0),
              AppButton(
                title: "Login",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context
                        .read<AuthBloc>()
                        .add(LoginEvent(phoneNumber!, password!));
                    // either.fold((failure) {
                    //   print("SOME ERROR OCCURRED $failure");
                    // }, (success) {
                    //   if (mounted) {
                    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (_) => const HomeScreen(),
                    //     ));
                    //   }
                    // });
                  } else {
                    print("Validation failed");
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
