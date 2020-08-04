import 'package:example/app/app_theme.dart';
import 'package:example/components/left_palette_component.dart';
import 'package:example/components/main_bg_component.dart';
import 'package:example/components/right_palette_component.dart';
import 'package:example/components/sphere_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildScale(
      scaleFactor: 1,
      context: context,
      child: Scaffold(
        body: Stack(
          children: [
            MainBgComponent(),
            SphereComponent(),
            LeftPaletteComponent(),
            RightPaletteComponent()
          ],
        ),
      ),
    );
  }

  buildScale({BuildContext context, double scaleFactor, Widget child}) {
    final scaleFactor = AppTheme.of(context).scale;
    final fraction = 1 / scaleFactor;
    return FractionallySizedBox(
      widthFactor: fraction,
      heightFactor: fraction,
      child: Transform.scale(scale: scaleFactor, child: child),
    );
  }
}
