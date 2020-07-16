import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightPaletteComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ConsumeValueNotifier(
        valueNotifier: Provider.of<Model>(context).bgGradient,
        builder: (context, valueNotifier) {
          return Palette(
            side: PaletteSide.Right,
            selectedGradient: valueNotifier.value,
            onPickGradient: (gradietn) {
              valueNotifier.value = gradietn;
            },
          );
        },
      ),
    );
  }
}
