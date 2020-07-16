import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

enum PaletteSide { Left, Right }

class Palette extends StatefulWidget {
  final PaletteSide side;
  final LinearGradient selectedGradient;
  final Function(LinearGradient gradietn) onPickGradient;

  const Palette({
    Key key,
    @required this.side,
    this.onPickGradient,
    @required this.selectedGradient,
  }) : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  bool isCodeShow = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context).paletteTheme;
    return Container(
      width: theme.circleSize + theme.horizontalPadding + 333,
      child: Stack(
        children: [
          ListView.builder(
            padding: getMargin(context),
            itemCount: niceGradients.length,
            itemBuilder: (context, index) {
              final gradient = niceGradients[index];
              return PaletteButton(
                side: widget.side,
                gradient: gradient,
                isSelected: widget.selectedGradient == gradient,
                onPickGradient: widget.onPickGradient,
                isCodeShow: isCodeShow,
                onShowCode: (bool isShow) {
                  setState(() {
                  isCodeShow = isShow;

                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  EdgeInsets getMargin(BuildContext context) {
    final theme = AppTheme.of(context).paletteTheme;
    switch (widget.side) {
      case PaletteSide.Left:
        return EdgeInsets.only(left: theme.horizontalPadding);
      case PaletteSide.Right:
        return EdgeInsets.only(right: theme.horizontalPadding);
      default:
        throw UnimplementedError();
    }
  }
}
