import 'package:example/app/app.dart' as app;
import 'package:example/app/config.dart' as app;
import 'package:flutter/material.dart';

void main() {
  runApp(
    app.Config(
      child: app.App(),
    ),
  );
}
