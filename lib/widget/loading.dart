import 'package:flutter/material.dart';


class Loading {
  void showLoadingDialog(BuildContext context,
      {String message = 'Loading...'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
         // contentPadding: EdgeInsets.zero,
          content: Container(
              color: Colors.transparent,
              height: 100,
              width: 10,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: Expanded(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )),
        );
      },
    );
  }

  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
