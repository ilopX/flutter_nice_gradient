import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/circle_button.dart';
import 'package:example/widgets/palette/code_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBuilder {
  final PaletteSide side;

  final bool Function() isCodePanelVisible;
  final LinearGradient Function() currentGradient;

  final void Function(LinearGradient gradient) onTapGradient;
  final void Function(bool isVisible) onCodePanelVisible;

  ItemBuilder({
    @required this.side,
    @required this.isCodePanelVisible,
    @required this.currentGradient,
    @required this.onTapGradient,
    @required this.onCodePanelVisible,
  });

  Widget buildItem(LinearGradient gradient) {
    return Stack(
      children: [
        if (isCodePanelVisible() && currentGradient() == gradient)
          buildOverflowCodePanel(gradient),
        buildCircleButton(gradient),
      ],
    );
  }

  Widget buildCircleButton(LinearGradient gradient) {
    return CircleButton(
      side: side,
      isSelected: gradient == currentGradient() && !isCodePanelVisible(),

      gradient: gradient,
      onTap: onTapGradient,
      onShowCodePanel: onCodePanelVisible,
    );
  }

  Widget buildOverflowCodePanel(LinearGradient gradient) {
    return CodePanel(side: side,);

  }

  bool isShowCodePanel(LinearGradient gradient) {
    return isCodePanelVisible() && currentGradient() == gradient;
  }
}
