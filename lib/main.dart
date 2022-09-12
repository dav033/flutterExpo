// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:precios/home.dart';
import 'package:precios/theme_provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation.name.toString();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    print('Orientacion:$orientation');
    print('Altura:$height');
    print('Ancho:$width');

    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: provider.themeMode,
        home: Home(height: height, orientation: orientation),
      );
    });
  }
}
