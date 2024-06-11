import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<CharactersModel> charactesrs = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    try {
      emit(CharactersLoading());
      await charactersRepository.getAllCharacters().then((value) {
        emit(CharactersLoaded(characters: value));
        charactesrs = value;
      });
    } on NoInternetException {
      emit(CharactersNoInternet());
    } catch (error) {
      emit(CharactersError(error.toString()));
    }
  }

  void retryLoadingCharacters() {
    if (state is CharactersError || state is CharactersNoInternet) {
      getAllCharacters();
    }
  }
}
