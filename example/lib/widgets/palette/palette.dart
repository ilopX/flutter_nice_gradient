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
  bool _isCodeVisible = true;

  bool get isCodeVisible => _isCodeVisible;

  set isCodeVisible(bool visible) {
    setState(() {
      _isCodeVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Align(
      alignment: align,
      child: Container(
        margin: theme.getPaletteMargin(widget.side),
        width: theme.paletteWidth,
        child: buildGradientList(theme),
      ),
    );
  }

  Alignment get align =>
      widget.side == PaletteSide.Left ? Alignment.topLeft : Alignment.topRight;

  Widget buildGradientList(AppTheme theme) {
    return ListView(
      children: [
        buildVerticalPadding(theme),
        ...niceGradients.map(buildLine),
        buildVerticalPadding(theme),
      ],
    );
  }

  Widget buildLine(LinearGradient gradient) {
    return Stack(
      children: [
        if (isCodePanelBuild(gradient))
          CodePanel(
            side: widget.side,
            gradient: widget.selectedGradient,
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

  bool isLasOrFirst(index) {
    return index == 0 || index == niceGradients.length + 1;
  }

  Widget buildVerticalPadding(AppTheme theme) {
    return SizedBox(height: theme.bodyPanelTopLeftBottomPadding * 2);
  }

  bool isCodePanelBuild(LinearGradient gradient) {
    return isCodeVisible && widget.selectedGradient == gradient;
  }
}
