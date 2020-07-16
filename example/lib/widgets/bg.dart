import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  final LinearGradient gradient;

  Bg({@required this.gradient});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(gradient: gradient),
      duration: Duration(seconds: 1),
    );
  }
}
