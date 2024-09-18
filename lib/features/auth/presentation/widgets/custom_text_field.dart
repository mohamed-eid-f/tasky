import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.onSaved,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        }
        return null;
      },
      onSaved: widget.onSaved,
      keyboardType: widget.textInputType,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
