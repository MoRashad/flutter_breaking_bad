import '../models/characters.dart';
import '../models/qoutes.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebService charactersWebService;

  CharactersRepository(this.charactersWebService);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebService.getCharacterQuotes(charName);

    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
