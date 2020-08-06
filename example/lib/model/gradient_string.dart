import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ApplyPointCallback = void Function(String fist, String second);

class GradientString {
  final LinearGradient gradient;

  GradientString({this.gradient}) {
    extractPoint(gradient.begin.toString(), (fist, second) {
      _beginX = fist.toString();
      _beginY = second.toString();
    });

    extractPoint(gradient.end.toString(), (fist, second) {
      _endX = fist.toString();
      _endY = second.toString();
    });

    extractPoint(gradient.colors.toString(), (fist, second) {
      _color1 = fist.toString();
      _color2 = second.toString();
    });

    _stop1 = gradient.stops.first.toString();
    _stop2 = gradient.stops.last.toString();
  }

  String _beginX;

  get beginX => _beginX;

  String _beginY;

  get beginY => _beginY;

  String _endX;

  get endX => _endX;

  String _endY;

  get endY => _endY;

  String _color1;

  String get color1 => _color1;

  String _color2;

  String get color2 => _color2;

  String _stop1;

  String get stop1 => _stop1;

  String _stop2;

  String get stop2 => _stop2;

  static final numberPattern = r'\-?\d+\.?\d+';
  static final colorPattern = r'0x[0-9a-f]+';

  static void extractPoint(String raw, ApplyPointCallback apply) {
    if (raw == 'bottomRight') {
      apply('1.0', '1.0');
      return;
    }

    final regExp = RegExp('\\(($numberPattern|$colorPattern)\\)?(, '
        '[^(]*($numberPattern|\\($colorPattern)\\))?');
    var matchPoints = regExp.firstMatch(raw);
    try {
      final fistGroup = matchPoints.group(1);
      final secondGroup = matchPoints.group(3);
      apply(fistGroup, secondGroup);
    } catch (e) {
      apply(null, null);
    }
  }
}
