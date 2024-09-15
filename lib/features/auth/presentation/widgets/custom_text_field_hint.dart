import 'package:flutter/material.dart';

class CustomTextFieldHint extends StatefulWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final int lines;

  const CustomTextFieldHint({
    super.key,
    required this.hint,
    this.controller,
    this.textInputType = TextInputType.text,
    this.lines = 1,
  });

  @override
  State<CustomTextFieldHint> createState() => _CustomTextFieldHintState();
}

class _CustomTextFieldHintState extends State<CustomTextFieldHint> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      minLines: widget.lines,
      maxLines: widget.lines,
      style: Theme.of(context).textTheme.displayLarge,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
