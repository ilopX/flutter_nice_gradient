import 'package:example/app/app_theme.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final PaletteSide side;
  final bool isSelected;
  final LinearGradient gradient;
  final void Function(LinearGradient setGradient) onTap;
  final void Function(bool isVisible) onShowCodePanel;


  const CircleButton({
    Key key,
    @required this.gradient,
    this.onTap,
    this.onShowCodePanel,
    @required this.isSelected,
    this.side,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    var circlePlusCodeButton = [
      buildOval(context),
      codeButton(),
    ]..removeWhere((element) => element == null);

    if (widget.side == PaletteSide.Left) {
      return Row(
        children: circlePlusCodeButton,
      );
    } else if (widget.side == PaletteSide.Right) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: circlePlusCodeButton.reversed.toList(),
      );
    }

    throw UnimplementedError();
  }

  Widget buildOval(BuildContext context) {
    var theme = AppTheme.of(context);
    return Container(
//      margin: theme.circleButtonMargin,
      width: theme.prefixPanelWidth,
      height: theme.overflowHeight,
      child: Center(
        child: ClipOval(
          child: Container(
            width: theme.circleButtonSize,
            height: theme.circleButtonSize,
            decoration:
                widget.isSelected ? _selectedDecoration : _normalDecoration,
            child: buildMouseDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap(widget.gradient);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget codeButton() {
    if (widget.isSelected) {
      return buildMouseDetector(
        onTap: () {
          widget.onShowCodePanel(true);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.black.withOpacity(_isHover ? 1.0 : 0.5),
          child: Text(
            'Code',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    return null;
  }

  Widget buildMouseDetector({Widget child, void Function() onTap}) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHover = false;
        });
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }

  BoxDecoration get _selectedDecoration {
    return BoxDecoration(
      gradient: widget.gradient,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      border: Border.all(color: Colors.white, width: 2),
    );
  }

  BoxDecoration get _normalDecoration {
    return BoxDecoration(
      gradient: widget.gradient,
    );
  }
}
