import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PaletteSide { Left, Right }

class AppTheme extends InheritedWidget {
  final double scale;
  final double paletteSideMargin;
  final double paletteTopMargin;
  final double sphereSize;
  final double circleButtonSize;
  final EdgeInsets circleButtonMargin;
  final double lineBodyWidth;
  final double overflowVerticalPadding;
  final Color prefixPanelColor;

  // auto calculate
  final double paletteWidth;
  final double overflowHeight;
  final double overflowPrefixPanelWidth;
  final double lineHeight;

  final ThemeData materialTheme;

  AppTheme( {
    Key key,
    @required this.scale,
    @required this.paletteSideMargin,
    @required this.paletteTopMargin,
    @required this.sphereSize,
    @required this.circleButtonSize,
    @required this.circleButtonMargin,
    @required this.lineBodyWidth,
    @required this.overflowVerticalPadding,
    @required this.prefixPanelColor,
    @required this.materialTheme,
    @required child,
  })  : paletteWidth = circleButtonMargin.left +
            circleButtonMargin.right +
            circleButtonSize +
            lineBodyWidth,
        lineHeight = circleButtonMargin.top +
            circleButtonMargin.bottom +
            circleButtonSize,
        overflowPrefixPanelWidth = circleButtonMargin.left +
            circleButtonMargin.right +
            circleButtonSize,
        overflowHeight = circleButtonMargin.top +
            circleButtonMargin.bottom +
            circleButtonSize +
            overflowVerticalPadding * 2,
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
        oldWidget.circleButtonMargin != circleButtonMargin ||
        oldWidget.lineBodyWidth != lineBodyWidth ||
        oldWidget.overflowVerticalPadding != overflowVerticalPadding ||
        oldWidget.paletteTopMargin != overflowVerticalPadding ||
        oldWidget.prefixPanelColor != prefixPanelColor;
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
