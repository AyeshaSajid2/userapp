// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;
  const ErrorDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message!),
      actions: [
        ElevatedButton(
          child: const Center(
            child: Text("OK"),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
