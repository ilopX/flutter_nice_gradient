import 'package:example/app/app_theme.dart';
import 'package:example/widgets/palette/item_builder.dart';
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
  bool _isCodeShow = false;

  ItemBuilder _paletteItemBuilder;

  @override
  void initState() {
    initPaletteItemBuilder();

    super.initState();
  }

  @override
  void reassemble() {
    initPaletteItemBuilder();
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Container(
          margin: AppTheme.of(context).getPaletteMargin(widget.side),
          width: AppTheme.of(context).paletteWidth,
          child: buildGradientList()),
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
                height: AppTheme.of(context).overflowVerticalPadding*2,
              )
            : _paletteItemBuilder.buildItem(niceGradients[index]);
      },
    );
  }

  void initPaletteItemBuilder() {
    _paletteItemBuilder = ItemBuilder(
      side: widget.side,
      isCodePanelVisible: () => _isCodeShow,
      currentGradient: () => widget.selectedGradient,
      onTapGradient: (gradient) {
        if (gradient == widget.selectedGradient) {
          setState(() {
            _isCodeShow = !_isCodeShow;
          });
        } else if (widget.onPickGradient != null) {
          widget.onPickGradient(gradient);
        }
      },
      onCodePanelVisible: (bool isVisible) {
        setState(() {
          _isCodeShow = isVisible;
        });
      },
    );
  }

  bool isLasOrFirst(index) {
    return index == 0 || index == niceGradients.length - 1;
  }
}
