import 'package:example/app/app_theme.dart';
import 'package:example/model/model.dart';
import 'package:example/services/gradient_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  final GradientParser gradientParser;

  const Button({Key key, this.gradientParser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final buttonHeight = theme.gradientTextStyle.fontSize * 2;
    final buttonWidth = theme.gradientTextStyle.fontSize * 4;

    return Opacity(
      opacity: 0.31,
      child: RawMaterialButton(
        child: Text('Copy'),
        constraints: BoxConstraints.expand(
          width: buttonWidth,
          height: buttonHeight,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(theme.borderRadius),
          ),
        ),
        fillColor: Colors.black,
        textStyle: theme.gradientTextStyle,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          Provider.of<Model>(context, listen: false)
              .copyGradientTextToClipboard(gradientParser);
        },
      ),
    );
  }
}
