import 'package:flutter/material.dart';
import 'package:tasky/core/consts/consts.dart';

class OnBoardingImgWidget extends StatelessWidget {
  const OnBoardingImgWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(kOnboardingImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
