import 'package:example/services/gradient_parser.dart';
import 'package:example/services/gradient_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

class Model {
  final gradient = ValueNotifier(niceGradients[1]);
  final bgGradient = ValueNotifier(niceGradients[5]);

  void copyGradientToClipboard(GradientParser gradientParser) async {
    final gradientConverter = GradientToString(gradientParser: gradientParser);
    final gradientText = gradientConverter.toString();
    final clipboardData = ClipboardData(text: gradientText);
    await Clipboard.setData(clipboardData);
  }
}
