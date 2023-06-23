import 'package:flutter/material.dart';
import 'package:kelompok/Models/FavoriteModel.dart';
import 'package:kelompok/views/homepage.dart';
import 'package:kelompok/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';
import 'package:kelompok/views/login.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    //
    //
    //
    //
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.purple),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: const MyHomePage(),
          );
        });
  }
}
