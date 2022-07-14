import 'package:flutter_breaking_bad/data/models/characters.dart';
import 'package:flutter_breaking_bad/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebService charactersWebService;

  CharactersRepository(this.charactersWebService);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
