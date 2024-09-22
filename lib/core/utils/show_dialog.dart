import 'package:flutter/material.dart';
import 'package:tasky/core/presentation/widgets/app_error_widget.dart';
import 'package:tasky/core/presentation/widgets/loading_widget.dart';

import '../consts/consts.dart';

class ShowDialog {
  final BuildContext context;

  ShowDialog(this.context);

  void showWidget(Widget widget) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: widget,
      ),
    );
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: const LoadingWidget(),
      ),
    );
  }

  void showErrorDialog({required String message, Function()? onPressed}) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        child: AppErrorWidget(message, onPressed: onPressed),
      ),
    );
  }
}
