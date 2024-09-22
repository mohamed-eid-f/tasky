import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/consts/consts.dart';

class PhoneTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final String? initialValue;
  final Function(PhoneNumber)? onChanged;
  final Function(Country)? onCountryChanged;
  final void Function(PhoneNumber?)? onSaved;

  const PhoneTextField({
    super.key,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.onCountryChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: "EG",
      initialValue: initialValue,
      validator: (value) {
        if (value == null) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
      onSaved: onSaved,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      languageCode: "en",
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
    );
  }
}
