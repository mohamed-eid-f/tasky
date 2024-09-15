import 'package:flutter/material.dart';

class AppCustomRichText extends StatelessWidget {
  const AppCustomRichText({
    super.key,
    required this.text_1,
    required this.text_2,
    this.onTap_1,
    this.onTap_2,
  });

  final String text_1;
  final String text_2;
  final Function()? onTap_1;
  final Function()? onTap_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap_1,
          child: Text(
            text_1,
            style: onTap_1 != null
                ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )
                : Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        InkWell(
          onTap: onTap_2,
          child: Text(
            text_2,
            style: onTap_2 != null
                ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    )
                : Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
