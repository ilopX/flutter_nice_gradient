import 'package:example/app/app_theme.dart';
import 'package:example/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() {
  runApp(InhData());
}

class InhData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Model()),
        Provider(create: (_) => AppTheme()),
      ],
      child: App(),
    );
  }
}

