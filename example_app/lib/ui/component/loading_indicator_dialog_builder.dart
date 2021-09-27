import 'package:flutter/material.dart';

import 'loading.dart';

class LoadingIndicatorDialogBuilder {
  LoadingIndicatorDialogBuilder(this.context);

  final BuildContext context;
  bool isShown = false;

  void show() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          isShown = true;
          return const Loading();
        });
  }

  void hide() {
    if (!isShown) return;

    Navigator.of(context).pop();
    isShown = false;
  }
}
