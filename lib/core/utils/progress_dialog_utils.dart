import 'package:flutter/material.dart';
import 'package:annoying_alarm/core/utils/navigator_service.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  /// Common method for showing progress dialog
  static void showProgressDialog(
      { BuildContext? context, bool isCancellable = false, }) async {
    if (!isProgressVisible &&
        NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
      showDialog(
        barrierDismissible: isCancellable,
        context: NavigatorService.navigatorKey.currentState!.overlay!.context,
        builder: (BuildContext context) {
          // ignore: prefer_const_constructors
          return Center(
            child: const CircularProgressIndicator.adaptive(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
          );
        },
      );
      isProgressVisible = true;
    }
  }

  /// Common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible &&
        NavigatorService.navigatorKey.currentState?.overlay?.context != null) {
      Navigator.pop(
          NavigatorService.navigatorKey.currentState!.overlay!.context);
      isProgressVisible = false;
    }
  }
}
