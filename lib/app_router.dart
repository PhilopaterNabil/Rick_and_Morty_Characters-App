import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/business_logic/cubit/characters_cubit.dart';
import 'package:shop/constants/strings.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/data/repository/characters_repository.dart';
import 'package:shop/data/web_services/characters_web_services.dart';
import 'package:shop/presentation/screens/characters_details_screen.dart';
import 'package:shop/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as CharactersModel;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(character: character));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
