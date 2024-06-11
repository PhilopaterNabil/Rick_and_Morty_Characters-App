part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoading extends CharactersState {}

final class CharactersLoaded extends CharactersState {
  final List<CharactersModel> characters;
  CharactersLoaded({required this.characters});
}

final class CharactersNoInternet extends CharactersState {}

final class CharactersError extends CharactersState {
  final String error;

  CharactersError(this.error);
}
