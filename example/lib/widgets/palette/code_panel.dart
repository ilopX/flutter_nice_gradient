import 'package:example/model/gradient_string.dart';
import 'package:example/vendor/reverse_if.dart';
import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/gradient_text_representation.dart';
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
      height: theme.lineHeight,
      width: theme.paletteWidth,
      child: OverflowBox(
        maxHeight: theme.overflowHeight,
        child: Container(
          child: Row(
            children: [
              buildPrefixPanel(context),
              buildTextPanel(),
            ].reversedIf(side != PaletteSide.Left),
          ),
        ),
      ),
    );
  }

  Widget buildPrefixPanel(BuildContext context) {
    return Container(
      width: AppTheme.of(context).overflowPrefixPanelWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: leftRadius(side != PaletteSide.Left)
      ),
    );
  }

  Widget buildTextPanel() {
    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.68),
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: leftRadius(side == PaletteSide.Left)
        ),
        child: GradientTextRepresentation(
          gradientString: GradientString(gradient: gradient),
        ),
      ),
    );
  }

  leftRadius(bool reverse) {
    return reverse
        ? rightBorderRadius()
        : leftBorderRadius();
  }

  leftBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    );
  }

  rightBorderRadius() {
    return BorderRadius.only(
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    );
  }


}
