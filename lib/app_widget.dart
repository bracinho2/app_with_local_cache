import 'package:app_with_local_cache/modules/presenter/page/pokemon_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/snackbar_manager/snackbar_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppWithLocalCache',
      scaffoldMessengerKey: SnackBarManager.snackKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonPage(
        store: context.read(),
      ),
    );
  }
}
