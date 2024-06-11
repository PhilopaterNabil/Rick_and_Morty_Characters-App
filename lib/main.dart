import 'package:flutter/material.dart';
import 'package:shop/app_router.dart';

void main() {
  runApp(CharactersApp(appRouter: AppRouter()));
}

class CharactersApp extends StatelessWidget {
  const CharactersApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      onGenerateRoute: appRouter.genrateRoute,
    );
  }
}
