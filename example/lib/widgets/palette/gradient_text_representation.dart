import 'package:example/model/gradient_string.dart';
import 'package:flutter/cupertino.dart';

class GradientTextRepresentation extends StatelessWidget {
  final GradientString gradientString;

  const GradientTextRepresentation({
    Key key,
    this.gradientString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberStyleText = TextStyle(
      color: const Color(0xffc3e2f9),
    );
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 12,
          color: const Color(0xffffffff),
        ),
        children: [
          TextSpan(text: '  LinearGradient(\n    begin: Alignment('),
          TextSpan(text: gradientString.beginX, style: numberStyleText),
          TextSpan(text: ', '),
          TextSpan(text: gradientString.beginY, style: numberStyleText),
          TextSpan(text: '),\n    end: Alignment('),
          TextSpan(text: gradientString.endX, style: numberStyleText),
          TextSpan(text: ', '),
          TextSpan(text: gradientString.endY, style: numberStyleText),
          TextSpan(text: '),\n    colors: [const Color('),
          TextSpan(text: gradientString.color1, style: numberStyleText),
          TextSpan(text: '), const Color('),
          TextSpan(text: gradientString.color2, style: numberStyleText),
          TextSpan(text: ')],\n    stops: ['),
          TextSpan(text: gradientString.stop1, style: numberStyleText),
          TextSpan(text: ', '),
          TextSpan(text: gradientString.stop2, style: numberStyleText),
          TextSpan(text: '],\n  ),'),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
