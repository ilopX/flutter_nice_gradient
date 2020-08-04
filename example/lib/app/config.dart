import 'package:example/app/app_theme.dart';
import 'package:example/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  final Widget child;

  const Config({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
//      key: GlobalKey(),
      providers: [
        Provider(create: (_) => Model()),
      ],
      child: AppTheme(
        scale: 1,
        paletteSideMargin: 19,
        paletteTopMargin: 16,
        sphereSize: 389,
        circleButtonSize: 46,
        circleButtonMargin: EdgeInsets.symmetric(
          horizontal: 27,
          vertical: 23,
        ),
        lineBodyWidth: 340,
        overflowVerticalPadding: 16,
        child: child,
      ),
    );
  }
}
