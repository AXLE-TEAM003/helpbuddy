import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit Confirmation'),
      content: const Text('Are you sure you want to exit?'),
      actions: <Widget>[
        OutlinedButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        OutlinedButton(
          child: const Text('Yes'),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      ],
    );
  }
}
