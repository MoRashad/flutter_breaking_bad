import 'package:bloc/bloc.dart';
import '../../data/models/qoutes.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';
import '../../data/repository/characters_repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(
    this.charactersRepository,
  ) : super(CharacterInitial());

  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
