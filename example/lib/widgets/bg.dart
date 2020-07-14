import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';
import 'package:provider/provider.dart';

class Bg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumeValueNotifier(
      valueNotifier: Provider.of<Model>(context).bgGradient,
      builder: (context, valueNotifier) {
        return AnimatedContainer(
          decoration: BoxDecoration(gradient: valueNotifier.value),
          duration: Duration(seconds: 1),
        );
      },
    );
  }
}
