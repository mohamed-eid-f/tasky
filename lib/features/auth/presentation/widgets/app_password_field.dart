import 'package:flutter/material.dart';

import '../../../../core/consts/app_colors.dart';
import '../../../../core/consts/consts.dart';

class AppPasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const AppPasswordField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool visible = false;

  @override
  void dispose() {
    widget.controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !visible,
      style: Theme.of(context).textTheme.displayLarge,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        labelText: widget.label,
        suffixIcon: InkWell(
          onTap: () {
            setState(
              () {
                visible = !visible;
              },
            );
          },
          child: Icon(
            visible ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
