import 'package:example/app/app_theme.dart';
import 'file:///D:/src/flutter/flutter_nice_gradients/example/lib/widgets/palette/gradient_circle_button.dart';
import 'file:///D:/src/flutter/flutter_nice_gradients/example/lib/widgets/palette/gradietn_code_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

enum PaletteSide { Left, Right }

class Palette extends StatefulWidget {
  final PaletteSide side;
  final LinearGradient defaultGradient;
  final Function(LinearGradient gradietn) onPickGradient;

  const Palette({
    Key key,
    @required this.side,
    @required this.onPickGradient,
    @required this.defaultGradient,
  }) : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  bool isCodeShow = false;
  PaletteTheme _theme;
  LinearGradient currentGradient;

  @override
  void initState() {
    currentGradient = widget.defaultGradient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = AppTheme.of(context).paletteTheme;

    return Align(
      alignment: getAlign,
      child: Container(
        width: getWidth,
        child: ListView.builder(
          padding: getPadding,
          itemCount: niceGradients.length,
          itemBuilder: (context, index) => buildButton(niceGradients[index]),
        ),
      ),
    );
  }


  EdgeInsets get getPadding {
    switch (widget.side) {
      case PaletteSide.Left:
        return EdgeInsets.only(left: _theme.horizontalPadding, top: 18+9.0);
      case PaletteSide.Right:
        return EdgeInsets.only(right: _theme.horizontalPadding);
      default:
        throw UnimplementedError();
    }
  }

  Alignment get getAlign =>
      widget.side == PaletteSide.Left ? Alignment.topLeft : Alignment.topRight;

  double get getWidth =>
      _theme.buttonSize +
      _theme.horizontalPadding +
      AppTheme.of(context).gradientCodePanelTheme.bodyWidth;


  Widget buildButton(LinearGradient gradient) {
    return Stack(
      overflow: Overflow.visible,

      children: [
        buildSize(
          child: buildGradientCodePanelIfActive(gradient),
        ),
        buildCircleButton(gradient)
      ],
    );
  }

  Widget buildSize({Widget child}) {
    return Container(
      width: 9 + 435 + 97.0,
      height: 24 + 24 + 45.0,
//      decoration: BoxDecoration(border: Border.all()),
      child: child,
    );
  }

  Widget buildGradientCodePanelIfActive(LinearGradient gradient) {
    if (isShowCodePanel(gradient))
      return OverflowBox(
        maxHeight: 150.0,
        maxWidth: 9 + 435 + 97.0,
        minWidth: 0,
        child: GradientCode(
          onClose: () {
            setState(() {
              isCodeShow = false;
            });
          },
        ),
      );
    else
      return null;
  }

  Widget buildCircleButton(LinearGradient gradient) {
    return GradientCircleButton(
      side: widget.side,
      isSelected: gradient == currentGradient && !isCodeShow,
      margin: EdgeInsets.only(top: 24),
      gradient: gradient,
      onTap: (setGradient) {
        if (widget.onPickGradient != null) {
          widget.onPickGradient(gradient);
        }
        setState(() {
          currentGradient = gradient;

        });
      },
      onShowCodePanel: (isVisible) {
        setState(() {
          isCodeShow = isVisible;
        });
      },
    );
  }

  bool isShowCodePanel(LinearGradient gradient) {
    return isCodeShow && currentGradient == gradient;
  }


}
