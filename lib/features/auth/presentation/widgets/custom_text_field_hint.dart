import 'package:flutter/material.dart';

class CustomTextFieldHint extends StatelessWidget {
  const CustomTextFieldHint({
    super.key,
    required this.hint,
    this.controller,
    this.textInputType = TextInputType.text,
    this.lines = 1,
  });
  final String hint;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      minLines: lines,
      maxLines: lines,
      style: Theme.of(context).textTheme.displayLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
