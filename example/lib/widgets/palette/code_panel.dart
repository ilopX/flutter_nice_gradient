import 'package:example/services/gradient_parser.dart';
import 'package:example/vendor/reverse_if.dart';
import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/button.dart';
import 'package:example/widgets/palette/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodePanel extends StatelessWidget {
  final LinearGradient gradient;
  final PaletteSide side;
  final void Function() onClose;

  const CodePanel({
    Key key,
    @required this.side,
    @required this.onClose,
    @required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      height: theme.overflowHeight,
      width: theme.paletteWidth,
      child: OverflowBox(
        maxHeight: theme.overflowHeight + theme.bodyPanelLeftPadding * 2,
        child: Container(
          child: Row(
            children: [
              buildPrefixPanel(context, theme),
              buildTextPanel(context),
            ].reversedIf(side != PaletteSide.Left),
          ),
        ),
      ),
    );
  }

  Widget buildPrefixPanel(BuildContext context, AppTheme theme) {
    return Container(
      width: theme.overflowPrefixPanelWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: makeBorderRadius(side != PaletteSide.Left, theme),
      ),
    );
  }

  Widget buildTextPanel(BuildContext context) {
    final gradientParser = GradientParser(gradient: gradient);
    final theme = AppTheme.of(context);
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: theme.bodyPanelColor,
            border: theme.codePanelBorder,
            borderRadius: makeBorderRadius(side == PaletteSide.Left, theme)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GradientText(
                gradientString: GradientParser(gradient: gradient),
                defaultTextStyle: theme.gradientTextStyle,
                numberColor: theme.gradientTextColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(theme.bodyPanelLeftPadding),
                child: Button(gradientParser: gradientParser),
              ),
            ),
          ],
        ),
      ),
    );
  }

  makeBorderRadius(bool reverse, AppTheme theme) {
    return reverse ? makeRightBorderRadius(theme) : makeLeftBorderRadius(theme);
  }

  makeLeftBorderRadius(AppTheme theme) {
    return BorderRadius.only(
      topLeft: Radius.circular(theme.borderRadius),
      bottomLeft: Radius.circular(theme.borderRadius),
    );
  }

  makeRightBorderRadius(AppTheme theme) {
    return BorderRadius.only(
      topRight: Radius.circular(theme.borderRadius),
      bottomRight: Radius.circular(theme.borderRadius),
    );
  }
}
