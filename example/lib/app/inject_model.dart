import 'package:example/app/app_theme.dart';
import 'package:example/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InjectModel extends StatelessWidget {
  final Widget child;

  InjectModel({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
//      key: GlobalKey(),
      providers: [
        Provider(create: (_) => Model()),
        Provider(create: (_) => AppTheme()),
      ],
      child: child,
    );
  }
}
