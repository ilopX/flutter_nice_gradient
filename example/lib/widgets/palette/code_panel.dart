import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaletteCodePanel extends StatelessWidget {
  final PaletteSide side;
  final void Function() onClose;

  const PaletteCodePanel({Key key, this.side, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context).gradientCodePanelTheme;
    return Container(
      width: theme.colorWidth + theme.bodyWidth,
      height: theme.height,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: theme.colorWidth,
            decoration: BoxDecoration(
              
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ],
      ),
    );
  }
}
