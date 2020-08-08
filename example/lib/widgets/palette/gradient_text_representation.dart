import 'package:example/app/app_theme.dart';
import 'package:example/services/gradient_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientTextRepresentation extends StatelessWidget {
  final GradientParser gradientString;
  final TextStyle defaultTextStyle;
  final Color numberColor;
  final TextStyle _numberTextStyle;

  GradientTextRepresentation({
    Key key,
    @required this.gradientString,
    @required this.defaultTextStyle,
    @required this.numberColor
  })  : _numberTextStyle = defaultTextStyle.copyWith(color: numberColor),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: defaultTextStyle.fontSize * defaultTextStyle.height * 6 + defaultTextStyle.fontSize /2,
//      color: Colors.white.withOpacity(0.2),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: AppTheme.of(context).bodyPanelLeftPadding),
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            normalText('LinearGradient('),
            Row(
              children: [
                normalText('    begin: Alignment('),
                numberText(gradientString.beginX),
                normalText(', '),
                numberText(gradientString.beginY),
                normalText('),')
              ],
            ),
            Row(
              children: [
                normalText('    end: Alignment('),
                numberText(gradientString.endX),
                normalText(', '),
                numberText(gradientString.endY),
                normalText('),')
              ],
            ),
            Row(
              children: [
                normalText('    colors: [const Color('),
                numberText(gradientString.color1),
                normalText('), const Color('),
                numberText(gradientString.color2),
                normalText(')],')
              ],
            ),
            Row(
              children: [
                normalText('    stops: ['),
                numberText(gradientString.stop1),
                normalText(', '),
                numberText(gradientString.stop2),
                normalText('],')
              ],
            ),
            normalText(')'),
          ],
        ),
      ),
    );
  }

  Widget normalText(String text) => Text(text, style: defaultTextStyle);

  Widget numberText(String text) => Text(text, style: _numberTextStyle);
}
