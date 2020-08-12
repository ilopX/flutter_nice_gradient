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
    return buildOverflow(
      theme: theme,
      child: Row(
        children: [
          buildPrefixPanel(context, theme),
          buildBodyPanel(context),
        ].reversedIf(side != PaletteSide.Left),
      ),
    );
  }

  Widget buildOverflow({@required AppTheme theme, @required Widget child}) {
    final realHeight = theme.overflowHeight +
        theme.bodyPanelTopLeftBottomPadding * 2 +
        theme.codePanelAddHeight;

    return Container(
      height: theme.overflowHeight,
      width: theme.paletteWidth,
      child: OverflowBox(
        maxHeight: realHeight,
        child: child,
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

  Widget buildBodyPanel(BuildContext context) {
    final gradientParser = GradientParser(gradient: gradient);
    final theme = AppTheme.of(context);

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.bodyPanelColor,
          border: theme.codePanelBorder,
          borderRadius: makeBorderRadius(side == PaletteSide.Left, theme),
        ),
        child: Stack(
          children: [
            buildRichText(theme, gradientParser),
            buildCopyButton(theme, gradientParser),
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

  Widget buildCopyButton(AppTheme theme, GradientParser gradientParser) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(theme.bodyPanelTopLeftBottomPadding),
        child: Button(gradientParser: gradientParser),
      ),
    );
  }

  buildRichText(AppTheme theme, GradientParser gradientParser) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GradientText(
        gradientString: gradientParser,
        defaultTextStyle: theme.gradientTextStyle,
        numberColor: theme.gradientTextColor,
      ),
    );
  }
}
