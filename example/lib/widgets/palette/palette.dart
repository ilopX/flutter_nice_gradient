import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/circle_button.dart';
import 'package:example/widgets/palette/code_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nice_gradients/nice_gradients.dart';

class Palette extends StatefulWidget {
  final PaletteSide side;
  final LinearGradient selectedGradient;
  final Function(LinearGradient gradietn) onPickGradient;

  Palette({
    Key key,
    @required this.side,
    @required this.onPickGradient,
    @required this.selectedGradient,
  }) : super(key: key);

  @override
  PaletteState createState() => PaletteState();
}

class PaletteState extends State<Palette> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Container(
        margin: AppTheme.of(context).getPaletteMargin(widget.side),
        width: AppTheme.of(context).paletteWidth,
        child: buildGradientList(),
      ),
    );
  }

  Alignment get align =>
      widget.side == PaletteSide.Left ? Alignment.topLeft : Alignment.topRight;

  Widget buildGradientList() {
    return ListView.builder(
      itemCount: niceGradients.length,
      itemBuilder: (context, index) {
        return isLasOrFirst(index)
            ? SizedBox(
                height: AppTheme.of(context).overflowVerticalPadding * 2,
              )
            : buildLine(niceGradients[index]);
      },
    );
  }

  Widget buildLine(LinearGradient gradient) {
    return Stack(
      children: [
        if (isCodeVisible && widget.selectedGradient == gradient)
          CodePanel(
            side: widget.side,
            gradient: widget.selectedGradient
          ),
        buildCircleButton(gradient),
      ],
    );
  }

  Widget buildCircleButton(LinearGradient gradient) {
    return CircleButton(
      side: widget.side,
      isSelected: widget.selectedGradient == gradient && !isCodeVisible,
      gradient: gradient,
      onTap: widget.onPickGradient,
      onShowCodePanel: (isVisible) => isCodeVisible = isVisible,
    );
  }

  bool _isCodeVisible = false;

  bool get isCodeVisible => _isCodeVisible;

  set isCodeVisible(bool visible) {
    setState(() {
      _isCodeVisible = visible;
    });
  }

  bool isLasOrFirst(index) {
    return index == 0 || index == niceGradients.length - 1;
  }
}
