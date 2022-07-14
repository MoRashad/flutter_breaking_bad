import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_breaking_bad/data/models/characters.dart';
import 'package:flutter_breaking_bad/data/repository/characters_repo.dart';

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
}
