import 'package:example/model/model.dart';
import 'package:example/vendor/consume_value_notifier.dart';
import 'package:example/widgets/bg.dart';
import 'package:example/widgets/palette.dart';
import 'package:example/widgets/sphere.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Bg(),
          Row(
            children: [
              ConsumeValueNotifier(
                valueNotifier: Provider.of<Model>(context).gradient,
                builder: (context, valueNotifier) {
                  return Palette(
                    side: PaletteSide.Left,
                    selectedGradient: valueNotifier.value,
                    onPickGradient: (gradietn) {
                      valueNotifier.value = gradietn;
                    },
                  );
                },
              ),
              ConsumeValueNotifier(
                valueNotifier: Provider.of<Model>(context).gradient,
                builder: (context, valueNotifier) {
                  return Expanded(
                    child: Sphere(
                      gradient: valueNotifier.value,
                    ),
                  );
                },
              ),
              ConsumeValueNotifier(
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
            ],
          )
        ],
      ),
    );
  }
}
