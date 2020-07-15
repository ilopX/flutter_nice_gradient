import 'package:example/app/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

enum PaletteSide { Left, Right }


class Palette extends StatelessWidget {
  final PaletteSide side;
  final LinearGradient selectedGradient;
  final Function(LinearGradient gradietn) onPickGradient;

  const Palette({
    Key key,
    @required this.side,
    this.onPickGradient,
    @required
    this.selectedGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context).paletteTheme;
    return Container(
      width: theme.circleSize + theme.horizontalPadding,
      child: ListView.builder(
        padding: getMargin(context),
        itemCount: niceGradients.length,
        itemBuilder: (context, index) {
          final gradient = niceGradients[index];
          return GestureDetector(
            onTap: () {
              if (onPickGradient != null) {
                onPickGradient(gradient);
              }
            },
            child: CircleButton(
              gradient: gradient,
              isSelected: selectedGradient == gradient,
            ),
          );
        },
      ),
    );
  }

  EdgeInsets getMargin(BuildContext context) {
    final theme = AppTheme.of(context).paletteTheme;
    switch (side) {
      case PaletteSide.Left:
        return EdgeInsets.only(left: theme.horizontalPadding);
      case PaletteSide.Right:
        return EdgeInsets.only(right: theme.horizontalPadding);
      default:
        throw UnimplementedError();
    }
  }
}

class CircleButton extends StatelessWidget {
  final Gradient gradient;
  final bool isSelected;

  const CircleButton({
    Key key,
    this.gradient,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context).paletteTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: theme.verticalPadding),
      height: theme.circleSize,
      child: ClipOval(
        child: Container(
            decoration: isSelected ? _selectedDecoration : _normalDecoration),
      ),
    );
  }

  BoxDecoration get _selectedDecoration {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      border: Border.all(color: Colors.white, width: 2),
    );
  }

  BoxDecoration get _normalDecoration {
    return BoxDecoration(
      gradient: gradient,
    );
  }
}
