import 'package:flutter/material.dart';
import 'package:flutter_breaking_bad/constants/Strings.dart';
import 'package:flutter_breaking_bad/presentation/screens/characters_details.dart';
import 'package:flutter_breaking_bad/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
