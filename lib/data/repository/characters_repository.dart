import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/data/web_services/characters_web_services.dart';

class CharactersRepository {
  CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      final List<dynamic> charactersData =
          await charactersWebServices.getAllCharacters();
      List<CharactersModel> characters = charactersData
          .map((character) => CharactersModel.fromJson(character))
          .toList();
      return characters;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NoInternetException('No Internet connection');
      }
      throw Exception('Failed to load characters: $e');
    } on SocketException {
      throw NoInternetException('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}

class NoInternetException implements Exception {
  final String message;

  NoInternetException(this.message);

  @override
  String toString() => message;
}
