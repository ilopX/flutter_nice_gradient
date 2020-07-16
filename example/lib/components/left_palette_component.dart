import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftPaletteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumeValueNotifier(
      valueNotifier: Provider.of<Model>(context).gradient,
      builder: (context, valueNotifier) {
        return Palette(
          side: PaletteSide.Left,
          selectedGradient: valueNotifier.value,
          onPickGradient: (gradient) {
            valueNotifier.value = gradient;
          },
        );
      },
    );
  }
}
