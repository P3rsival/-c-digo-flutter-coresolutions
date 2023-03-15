import 'package:flutter/material.dart';

class LogoCoresolutions extends StatelessWidget {
  const LogoCoresolutions({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(
          fontSize: size ?? 16,
          //fontFamily: 'Arial',
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: 'Core',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: 'Solutions',
          ),
        ],
      ),
    );
  }
}
