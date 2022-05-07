import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController textController;
  final Function() submitForm;
  final TextInputType keyboardType;

  const AdaptativeTextField({
    Key? key,
    required this.label,
    required this.textController,
    required this.submitForm,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
                controller: textController,
                onSubmitted: (_) => submitForm(),
                keyboardType: keyboardType,
                placeholder: label,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                )),
          )
        : TextField(
            controller: textController,
            onSubmitted: (_) => submitForm(),
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: keyboardType,
          );
  }
}
