import 'package:floating_bottom_nav_example/src/routes.dart';
import 'package:floating_bottom_nav_example/src/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Bottom Nav',
      theme: theme,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}
