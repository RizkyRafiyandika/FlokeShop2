import 'package:flokemon/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:flokemon/Login.dart';
import 'package:flokemon/Model/Detail.blastoite.dart';
import 'package:flokemon/Model/Detail_charoza.dart';
import 'package:flokemon/Model/Detail_kuramon.dart';
import 'package:flokemon/Model/Detail_pikachu.dart';
import 'package:flokemon/components/inventory.dart';
import 'package:flokemon/home.dart';
import 'package:flokemon/register.dart';

class AppRoutes {
  static const String signUpPageScreen = '/register';

  static const String loginPageScreen = '/login';

  static const String homePageScreen = '/home';

  static const String inventoryScreen = '/inventory';

  static const String profileScreen = '/profile';

  static const String blastoiteScreen = '/Detail_blastoite';

  static const String blastoiteStatScreen = '/blastoite_stat_screen';

  static const String charizardScreen = '/charizard_screen';

  static const String charizardStatScreen = '/charizard_stat_screen';

  static const String withlistScreen = '/withlist_screen';

  static const String pikachuScreen = '/pikachu_screen';

  static const String pikachuStatScreen = '/pikachu_stat_screen';

  static const String kuramonScreen = '/kuramon_screen';

  static const String kuramonStatScreen = '/kuramon_stat_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginPageScreen: (context) => LoginPage(),
    signUpPageScreen: (context) => RegisterPage(),
    homePageScreen: (context) => HomePage(),
    inventoryScreen: (context) => InventoryPage(),
    profileScreen: (context) => profilePage(),
    blastoiteScreen: (context) => BlastoiteScreen(),
    // blastoiteStatScreen: (context) => BlastoiteStatScreen(),
    charizardScreen: (context) => CharizardScreen(),
    // charizardStatScreen: (context) => CharizardStatScreen(),
    // withlistScreen: (context) => WithlistScreen(),
    pikachuScreen: (context) => PikachuScreen(nama: 'Raikiri'),
    // pikachuStatScreen: (context) => PikachuStatScreen(),
    kuramonScreen: (context) => KuramonScreen(),
    // kuramonStatScreen: (context) => KuramonStatScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen()
  };
}
