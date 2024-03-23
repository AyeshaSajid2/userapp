// ignore_for_file: prefer_interpolation_to_compose_strings, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'progress_bar.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  // ignore: prefer_const_constructors_in_immutables
  LoadingDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          Text(message! + ", Please wait..."),
        ],
      ),
    );
  }
}
