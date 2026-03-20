import 'package:app_clone_mercado_livre/cart.store.dart';
import 'package:app_clone_mercado_livre/pages/home_page.dart';
import 'package:app_clone_mercado_livre/home.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<CartStore>(CartStore());
  GetIt.I.registerSingleton<HomeStore>(HomeStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App clone Mercado Livre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}
