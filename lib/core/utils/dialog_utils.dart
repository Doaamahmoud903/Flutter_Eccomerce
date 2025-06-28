import 'package:flutter/material.dart';
import '../theming/styles_manager.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: Styles.medium18Header,
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
        required String message,
        String? title,
        String? posActionName,
        Function? posAction,
        String? negActionName,
        Function? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: Styles.medium18Header,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName, style: Styles.medium18Header)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: Styles.medium18Header,
            ),
            title: Text(
              title ?? '',
              style: Styles.medium18Header,
            ),
            actions: actions,
          );
        });
  }
}
