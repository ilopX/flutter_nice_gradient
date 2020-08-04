import 'package:example/app/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodePanel extends StatelessWidget {
  final PaletteSide side;
  final void Function() onClose;

  const CodePanel({Key key, this.side, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      height: theme.lineHeight,
      width: theme.paletteWidth,

      child: OverflowBox(
        maxHeight: theme.overflowHeight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(children: row(context)),
        ),
      ),
    );
  }

  Widget buildPrefixPanel(BuildContext context) {
    return Container(
      width: AppTheme.of(context).overflowPrefixPanelWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: side == PaletteSide.Left ? BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ) : BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  row(BuildContext context) {
    final row = [
      buildPrefixPanel(context),
      Expanded(
        child: Container(
          height: AppTheme.of(context).lineHeight,

          child: SelectableText('some'),
        ),
      ),
    ];
    return side == PaletteSide.Left ? row : row.reversed.toList();
  }
}
