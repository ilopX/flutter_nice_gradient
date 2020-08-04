import 'package:example/app/app_theme.dart';
import 'package:example/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice gradients',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.of(context).materialTheme,
      home: HomePage(),
    );
  }
}
