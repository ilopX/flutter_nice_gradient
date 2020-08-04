import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:example/app/app_theme.dart';

import 'package:provider/provider.dart';

class RightPaletteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConsumeValueNotifier(
      valueNotifier: Provider.of<Model>(context).bgGradient,
      builder: (context, valueNotifier) {
        return Palette(
          side: PaletteSide.Right,
          selectedGradient: valueNotifier.value,
          onPickGradient: (gradient) {
            valueNotifier.value = gradient;
          },
        );
      },
    );
  }
}
