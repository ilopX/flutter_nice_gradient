import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart' as vendor;
import 'package:example/widgets/palette/palette.dart';
import 'package:example/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftPaletteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return vendor.ConsumeValueNotifier(
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
