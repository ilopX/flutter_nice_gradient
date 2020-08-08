import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PaletteSide { Left, Right }

class AppTheme extends InheritedWidget {
  final double scale;
  final double paletteSideMargin;
  final double prefixPanelWidth;
  final double sphereSize;
  final double circleButtonSize;
  final double bodyPanelWidth;
  final Color bodyPanelColor;
  final TextStyle gradientTextStyle;
  final Color gradientTextColor;
  final Border codePanelBorder;
  final double borderRadius;

  // auto calculate
  final double paletteWidth;
  final double overflowHeight;
  final double overflowPrefixPanelWidth;
  final double bodyPanelLeftPadding;
  final ThemeData materialTheme;

  AppTheme({
    Key key,
    @required this.scale,
    @required this.paletteSideMargin,
    @required this.prefixPanelWidth,
    @required this.sphereSize,
    @required this.circleButtonSize,
    @required this.bodyPanelWidth,
    @required this.bodyPanelColor,
    @required this.materialTheme,
    @required this.gradientTextStyle,
    @required this.gradientTextColor,
    @required this.codePanelBorder,
    @required this.borderRadius,
    @required child,
  })  : this.bodyPanelLeftPadding = gradientTextStyle.fontSize,
        overflowHeight =
            gradientTextStyle.fontSize * (gradientTextStyle.height + 0.03) * 6,
        paletteWidth = prefixPanelWidth + bodyPanelWidth,
        overflowPrefixPanelWidth = prefixPanelWidth,
        super(key: key, child: child);

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return oldWidget.scale != scale ||
        oldWidget.paletteSideMargin != paletteSideMargin ||
        oldWidget.sphereSize != sphereSize ||
        oldWidget.circleButtonSize != circleButtonSize ||
        oldWidget.bodyPanelWidth != bodyPanelWidth ||
        oldWidget.bodyPanelColor != bodyPanelColor ||
        oldWidget.prefixPanelWidth != prefixPanelWidth ||
        oldWidget.gradientTextStyle != gradientTextStyle ||
        oldWidget.gradientTextColor != gradientTextColor ||
        oldWidget.codePanelBorder != codePanelBorder ||
        oldWidget.borderRadius != borderRadius;
  }

  EdgeInsets getPaletteMargin(PaletteSide side) {
    switch (side) {
      case PaletteSide.Left:
        return EdgeInsets.only(left: paletteSideMargin);
      case PaletteSide.Right:
        return EdgeInsets.only(right: paletteSideMargin);
      default:
        throw UnimplementedError();
    }
  }
}
