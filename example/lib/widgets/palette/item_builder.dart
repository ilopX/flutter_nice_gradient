import 'package:example/widgets/palette/palette_circle_button.dart';
import 'package:example/widgets/palette/palette_code_panel.dart';
import 'package:example/widgets/palette/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaletteItemBuilder {
  final PaletteSide side;

  final bool Function() isCodeShow;
  final LinearGradient Function() currentGradient;

  final void Function(LinearGradient gradient) onTapGradient;
  final void Function(bool isVisible) onCodePanelVisible;

  PaletteItemBuilder({
    @required this.side,
    @required this.isCodeShow,
    @required this.currentGradient,
    @required this.onTapGradient,
    @required this.onCodePanelVisible,
  });

  Widget buildItem(LinearGradient gradient) {
    return Stack(

      children: [
        buildSize(
          child: ifShowCodePanelBuildGradientCodePanel(gradient),
        ),
        buildCircleButton(gradient)
      ],
    );
  }

  Widget buildSize({Widget child}) {
    return Container(

      width: 9+435 + 97.0 - 58,
      height: 24 + 24 + 45.0,
//      decoration: BoxDecoration(border: Border.all()),
      child: child,
    );
  }

  Widget ifShowCodePanelBuildGradientCodePanel(LinearGradient gradient) {
    if (isShowCodePanel(gradient))
      return OverflowBox(
        maxHeight: 800.0,
        maxWidth: 435 + 97.0+9,
        minWidth: 0,
        child: PaletteCodePanel(
          onClose: () => onCodePanelVisible(false),
        ),
      );
    else
      return null;
  }

  Widget buildCircleButton(LinearGradient gradient) {
    return PaletteCircleButton(
      side: side,
      isSelected: gradient == currentGradient() && !isCodeShow(),
      margin: EdgeInsets.only(top: 24),
      gradient: gradient,
      onTap: onTapGradient,
      onShowCodePanel: onCodePanelVisible,
    );
  }

  bool isShowCodePanel(LinearGradient gradient) {
    return isCodeShow() && currentGradient() == gradient;
  }
}
