import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

enum PaletteSide { Left, Right }

final circleSize = 45.0;
final horizontalPadding = 35.0;
final verticalPadding = 24.0;

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
    return Container(
      width: circleSize + horizontalPadding,
      child: ListView.builder(
        padding: margin,
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

  EdgeInsets get margin {
    switch (side) {
      case PaletteSide.Left:
        return EdgeInsets.only(left: horizontalPadding);
      case PaletteSide.Right:
        return EdgeInsets.only(right: horizontalPadding);
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalPadding),
      height: circleSize,
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
