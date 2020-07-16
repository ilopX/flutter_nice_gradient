import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTheme {
  double scale = 0.5;

  final materialTheme = ThemeData(
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white.withOpacity(0.5),
      ),
    ),
  );

  final paletteTheme = PaletteTheme(
    circleSize: 45.0,
    horizontalPadding: 35.0,
    verticalPadding: 24.0
  );

  static AppTheme of(BuildContext context) {
    return Provider.of<AppTheme>(context);
  }
}


class PaletteTheme {
   double circleSize;
   double horizontalPadding;
   double verticalPadding;

  PaletteTheme({
    @required this.circleSize,
    @required this.horizontalPadding,
    @required this.verticalPadding,
  });
}
