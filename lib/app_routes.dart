import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking_bad/business_logic/cubit/character_cubit.dart';
import 'package:flutter_breaking_bad/constants/Strings.dart';
import 'package:flutter_breaking_bad/data/models/characters.dart';
import 'package:flutter_breaking_bad/data/repository/characters_repo.dart';
import 'package:flutter_breaking_bad/data/web_services/characters_web_services.dart';
import 'package:flutter_breaking_bad/presentation/screens/characters_details_screen.dart';
import 'package:flutter_breaking_bad/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebService());
    characterCubit = CharacterCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharacterCubit(charactersRepository),
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
                  character: character,
                ));
    }
    return null;
  }
}
