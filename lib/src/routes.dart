import 'package:flutter/material.dart';
import 'package:floating_bottom_nav_example/src/page/pages.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const NavPage());
    default:
      return MaterialPageRoute(builder: (_) => const NavPage());
  }
}
