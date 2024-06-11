import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:shop/business_logic/cubit/characters_cubit.dart';
import 'package:shop/constants/my_colors.dart';
import 'package:shop/data/models/characters_model.dart';
import 'package:shop/presentation/widgets/app_bar_actions_widget.dart';
import 'package:shop/presentation/widgets/app_bar_title_widget.dart';
import 'package:shop/presentation/widgets/character_list_widget.dart';
import 'package:shop/presentation/widgets/loading_indicator.dart';
import 'package:shop/presentation/widgets/no_internet_widget.dart';
import 'package:shop/presentation/widgets/search_field_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharactersModel> allCharacters;
  late List<CharactersModel> searchedForCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        elevation: 3,
        leading: _isSearching
            ? const BackButton(color: MyColors.myGrey)
            : Container(),
        title: _isSearching
            ? SearchFieldWidget(
                searchTextController: _searchTextController,
                onChanged: (searchedCharacter) {
                  addSearchedForItemsToSearchedList(searchedCharacter);
                },
                hintText: 'Find a character...',
              )
            : const AppBarTitleWidget(title: 'Characters'),
        actions: [
          AppBarActionsWidget(
            isSearching: _isSearching,
            clearSearch: () {
              _clearSearch();
              Navigator.pop(context);
            },
            startSearch: () {
              _startSearch();
            },
          ),
        ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connectivityStatus =
              connectivity != ConnectivityResult.none;
          if (connectivityStatus) {
            context.read<CharactersCubit>().retryLoadingCharacters();
            return buildBlocWidget();
          } else {
            return const NoInternetWidget();
          }
        },
        child: const LoadingIndicator(),
      ),
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return CharacterListWidget(
            characters: allCharacters,
            searchTextController: _searchTextController,
            searchedForCharacters: searchedForCharacters,
          );
        } else if (state is CharactersNoInternet) {
          return const NoInternetWidget();
        } else if (state is CharactersError) {
          if (state.error == 'No Internet connection') {
            return const NoInternetWidget();
          } else {
            return Center(
              child: Text('Failed to load characters: ${state.error}'),
            );
          }
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
