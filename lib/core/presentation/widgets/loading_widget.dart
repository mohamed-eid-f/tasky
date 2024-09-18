import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(32),
        // height: MediaQuery.of(context).size.height / 3,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
