import 'package:flutter/material.dart';
import 'package:flokemon/Model/shop.dart';
import 'package:flokemon/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Menggunakan home properti untuk halaman utama jika tidak menggunakan routes
      // home: HomePage(username: 'rizky'),

      initialRoute: AppRoutes.loginPageScreen, // Atur rute awal di sini
      routes: AppRoutes.routes,
    );
  }
}
