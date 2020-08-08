import 'package:example/services/gradient_parser.dart';

class GradientToString {
  final GradientParser gradientParser;

  GradientToString({this.gradientParser});

  @override
  String toString() {
    return
      'LinearGradient('
      '\n  begin: Alignment(${gradientParser.beginX}, ${gradientParser.beginY}),'
      '\n  end: Alignment(${gradientParser.endX}, ${gradientParser.endY}),'
      '\n  colors: ['
          'const Color(${gradientParser.color1}), '
          'const Color(${gradientParser.color2}),'
          '],'
      '\n  stops: [${gradientParser.stop1}, ${gradientParser.stop2}],'
      '\n),';
  }
}

