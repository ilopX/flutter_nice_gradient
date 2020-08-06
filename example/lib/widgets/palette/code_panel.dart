import 'package:example/model/gradient_string.dart';
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
      height: theme.lineHeight,
      width: theme.paletteWidth,
      child: OverflowBox(
        maxHeight: theme.overflowHeight,
        child: Container(
          child: Row(
            children: [
              buildPrefixPanel(context),
              buildTextPanel(context),
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
          borderRadius: leftRadius(side != PaletteSide.Left)),
    );
  }

  Widget buildTextPanel(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: AppTheme.of(context).prefixPanelColor,
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: leftRadius(side == PaletteSide.Left)),
          child: Stack(
            children: [
              GradientTextRepresentation(
                gradientString: GradientString(gradient: gradient),
              ),
              buildCopyButton()
            ],
          )),
    );
  }

  leftRadius(bool reverse) {
    return reverse ? rightBorderRadius() : leftBorderRadius();
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

  buildCopyButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.31,
        child: RawMaterialButton(

          child: Text('Copy'),
          constraints: BoxConstraints.tight(Size(42, 26)),
          shape: RoundedRectangleBorder(
            side:  BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Colors.black,
          textStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'Segoe',
            color: Colors.white,
          ),

          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () async {
            final clipboardData = ClipboardData(text: gradient.toString());
            await Clipboard.setData(clipboardData);
          },
        ),
      ),
    );
  }
}
