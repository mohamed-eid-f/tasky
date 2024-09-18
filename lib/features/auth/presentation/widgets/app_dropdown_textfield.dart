import 'package:flutter/material.dart';

class AppDropdownTextField extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final void Function(String?)? onSelected;

  const AppDropdownTextField({
    super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.onSelected,
  });

  @override
  State<AppDropdownTextField> createState() => _AppDropdownTextFieldState();
}

class _AppDropdownTextFieldState extends State<AppDropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: widget.onSelected,
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
