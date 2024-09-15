import 'package:flutter/material.dart';

class AppDropdownTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;

  const AppDropdownTextField({
    super.key,
    required this.label,
    required this.controller,
    this.textInputType = TextInputType.text,
  });

  @override
  State<AppDropdownTextField> createState() => _AppDropdownTextFieldState();
}

class _AppDropdownTextFieldState extends State<AppDropdownTextField> {
  @override
  void dispose() {
    widget.controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      controller: widget.controller,
      label: Text(widget.label),
      width: double.infinity,
      textStyle: Theme.of(context).textTheme.bodyLarge,
      inputDecorationTheme: Theme.of(context).inputDecorationTheme,
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: 'fresh',
          label: "Fresh",
        ),
        DropdownMenuEntry(
          value: 'junior',
          label: "Junior",
        ),
        DropdownMenuEntry(
          value: 'midLevel',
          label: "Mid-Level",
        ),
        DropdownMenuEntry(
          value: 'senior',
          label: "Senior",
        ),
      ],
      trailingIcon: const Icon(Icons.keyboard_arrow_down),
    );
  }
}
