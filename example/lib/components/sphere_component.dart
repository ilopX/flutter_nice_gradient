import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/sphere.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SphereComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumeValueNotifier(
      valueNotifier: Provider.of<Model>(context).gradient,
      builder: (context, valueNotifier) {
        return Sphere(
          gradient: valueNotifier.value,
        );
      },
    );
  }
}
