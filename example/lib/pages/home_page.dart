import 'package:example/app/app_theme.dart';
import 'package:example/components/main_bg_component.dart';
import 'package:example/components/sphere_component.dart';
import 'package:example/widgets/git_hub_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildScale(
      scaleFactor: AppTheme.of(context).scale,
      context: context,
      child: Scaffold(
        body: Stack(children: [
          MainBgComponent(),
          SphereComponent(),
//          LeftPaletteComponent(),
//          RightPaletteComponent(),
          GitHubButton(
            onPressed: () async {
              if (kIsWeb) {
                html.document.window.location.href =
                    'https://github.com/ilopX/flutter_nice_gradient/tree/master/example';
              }
            },
          ),
        ]),
      ),
    );
  }

  buildScale({BuildContext context, double scaleFactor, Widget child}) {
    final fraction = 1 / scaleFactor;
    return FractionallySizedBox(
      widthFactor: fraction,
      heightFactor: fraction,
      child: Transform.scale(scale: scaleFactor, child: child),
    );
  }
}
