import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

class Model {
  final gradient = ValueNotifier(niceGradients[20]);
  final bgGradient = ValueNotifier(niceGradients[10]);
}
