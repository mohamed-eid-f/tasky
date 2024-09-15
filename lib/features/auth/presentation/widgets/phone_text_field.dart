import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/consts/consts.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
    this.focusNode,
    this.onChanged,
    this.onCountryChanged,
  });

  final FocusNode? focusNode;
  final Function(PhoneNumber)? onChanged;
  final Function(Country)? onCountryChanged;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
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
      style: Theme.of(context).textTheme.displayLarge,
      onChanged: onChanged,
      onCountryChanged: onCountryChanged,
    );
  }
}
