import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaletteButton extends StatefulWidget {
  final LinearGradient gradient;
  final bool isSelected;
  final bool isCodeShow;
  final Function(LinearGradient gradietn) onPickGradient;
  final Function(bool isShow) onShowCode;
  final PaletteSide side;

  const PaletteButton({
    Key key,
    this.gradient,
    this.isSelected = false,
    this.onPickGradient,
    this.onShowCode,
    this.isCodeShow,

    @required this.side,
  }) : super(key: key);

  @override
  _PaletteButtonState createState() => _PaletteButtonState();
}

class _PaletteButtonState extends State<PaletteButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme
        .of(context)
        .paletteTheme;
    return widget.side == PaletteSide.Left ? Row(

      children: [
        buildOvalButton(theme),
        if (isHover && !widget.isCodeShow)
          buildCodeButton(),
        if (widget.isSelected && widget.isCodeShow)
          buildGradietText()
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (widget.isSelected && widget.isCodeShow)
          buildGradietText(),
        if (isHover && !widget.isCodeShow)
          buildCodeButton(),
        buildOvalButton(theme),
      ],
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

  buildOvalButton(PaletteTheme theme, [bool useMargin = true]) {
    return Container(
      margin: useMargin ? EdgeInsets.symmetric(vertical: theme.verticalPadding) : null,
      width: theme.circleSize,
      height: theme.circleSize,
      child: ClipOval(
        child: MouseRegion(
          onEnter: (_) {
            if (widget.isSelected) {
              setState(() {
                isHover = true;
              });
            }
          },
          onExit: (_) {
            setState(() {
              isHover = false;
            });
          },
          child: GestureDetector(
            onTap: () {
              if (widget.isSelected && widget.isCodeShow) {
                widget.onShowCode(false);
              } else {
                setState(() {
                  isHover = true;
                });
                if (widget.onPickGradient != null) {
                  widget.onPickGradient(widget.gradient);
                }
              }

            },

            child: Container(
              decoration: widget.isSelected
                  ? _selectedDecoration
                  : _normalDecoration,
            ),
          ),
        ),
      ),
    );
  }

  buildCodeButton() {
    return MouseRegion(
        onEnter: (_) {
          if (widget.isSelected) {
            setState(() {
              isHover = true;
            });
          }
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            if (widget.onShowCode != null) {
              widget.onShowCode(true);
              setState(() {

              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            width: 100,
            height: 20,
            child: Text(
              'Code',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
  }

  buildGradietText() {
    return MouseRegion(
      onExit: (_) {
        isHover = false;
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.onShowCode(false);
            isHover = false;
          });
        },
        child: Transform.translate(
          offset: Offset(widget.side == PaletteSide.Left ? -10 : 10, 0),
          child: Container(
            color: Colors.white,
            width: 300,
            height: 60,
            child: Row(
              children: [
                SelectableText('color1: ${widget.gradient
                    .colors[0]},\n color1: ${widget.gradient.colors[1]}'),
                Container(width: 10, height: 10, color: Colors.black,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
