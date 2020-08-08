import 'package:example/app/app_theme.dart';
import 'package:example/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  final Widget child;

  const Config({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Model()),
      ],
      child: AppTheme(
        scale: 1.0,
        paletteSideMargin: 19,
        sphereSize: 389,
        circleButtonSize: 46,
        prefixPanelWidth: 100,
        bodyPanelWidth: 344,
        bodyPanelColor: Colors.black.withOpacity(0.68),
        gradientTextStyle: const TextStyle(
          fontFamily: 'Segoe',
          fontSize: 12,
          height: 1.333,
          color: Colors.white,
        ),
        gradientTextColor: const Color(0xffc3e2f9),
        codePanelBorder: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: 8.0,
        materialTheme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.black.withOpacity(0.68),
          ),
        ),
        child: child,
      ),
    );
  }
}
