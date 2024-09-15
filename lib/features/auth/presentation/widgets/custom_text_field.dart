import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.textInputType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      style: Theme.of(context).textTheme.displayLarge,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
