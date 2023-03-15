import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LogoCoreinvent extends StatelessWidget {
  const LogoCoreinvent({super.key, this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return GradientText(
      'CoreInvent',
      style: TextStyle(
        fontSize: size ?? 28,
        fontWeight: FontWeight.w500,
      ),
      colors: Theme.of(context).brightness == Brightness.light
          ? const [
              Color(0xFF006783),
              Color(0xFF547DBE),
              Color(0xFF09ADEA),
            ]
          : const [
              Color(0xFF09ADEA),
              Color(0xFF547DBE),
              Color(0xFF006783),
            ],
    );
  }
}
