import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/bg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBgComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumeValueNotifier(
      valueNotifier: Provider.of<Model>(context).bgGradient,
      builder: (context, valueNotifier) {
        return Bg(gradient: valueNotifier.value);
      },
    );
  }
}
