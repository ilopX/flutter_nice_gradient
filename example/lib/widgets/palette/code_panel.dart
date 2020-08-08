import 'package:example/services/gradient_parser.dart';
import 'package:example/services/gradient_to_string.dart';
import 'package:example/vendor/reverse_if.dart';
import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/gradient_text_representation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        maxHeight: theme.overflowHeight+theme.bodyPanelLeftPadding*2,
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
      width: AppTheme
          .of(context)
          .overflowPrefixPanelWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: makeBorderRadius(side != PaletteSide.Left, theme)),
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
              child: GradientTextRepresentation(
                gradientString: GradientParser(gradient: gradient),
                defaultTextStyle: theme.gradientTextStyle,
                numberColor: theme.gradientTextColor,
              ),
            ),
            buildCopyButton(theme, gradientParser)
          ],
        ),
      ),
    );
  }

  buildCopyButton(AppTheme theme, GradientParser gradientParser) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.31,
        child: Padding(
          padding: EdgeInsets.all(theme.bodyPanelLeftPadding),
          child: RawMaterialButton(
            child: Text('Copy'),
            constraints: BoxConstraints.tight(Size(42, 26)),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                  Radius.circular(theme.borderRadius)),
            ),
            fillColor: Colors.black,
            textStyle: theme.gradientTextStyle,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () async {
              final gradientConverter = GradientToString(
                  gradientParser: gradientParser);
              final clipboardData = ClipboardData(
                  text: gradientConverter.toString());
              await Clipboard.setData(clipboardData);
              final i = 0.0;
              print(i.toStringAsFixed(1));
            },
          ),
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
