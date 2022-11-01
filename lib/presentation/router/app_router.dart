import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/help/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/home_view.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/verify_phone.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/home/product_details_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/login/login_screen.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String verifyScreen = "/verifyScreen";
  static const String mainScreen = "/main";
  static const String helpScreen = "/helpScreen";
  static const String homeRoute = "/home";
  static const String productDetailsRoute = "/productDetails";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  SplachScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.verifyScreen:
        return MaterialPageRoute(builder: (_) => VerifyPhone());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HelpScreen());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());
      default:
        return null;
    }
  }
}