import 'package:flutter/material.dart';
import 'package:movie/Routes/app_navigation_routes.dart';
import 'package:movie/screens/HomeScreen/home_screen.dart';
import 'package:movie/screens/LoginScreen/login_screen.dart';
import 'package:movie/screens/RegistrationScreen/register_screen.dart';
import 'package:movie/screens/favourite/fav_movies_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const LoginScreen());

      case AppNavRoutes.favMovieListScreen:
        return routeScreen(child: const FavMoviesList());

      case AppNavRoutes.loginScreen:
        return routeScreen(child: const LoginScreen());

      case AppNavRoutes.registrationScreen:
        return routeScreen(child: const RegisterScreen());

      case AppNavRoutes.homeScreen:
        return routeScreen(child: const HomeScreen());

      // case AppNavRoutes.quizScreen:
      //   return routeScreen(child: const QuizScreen());

      // case AppNavRoutes.userScreen:
      //   UserProfileModel kuchbhi = args as UserProfileModel;
      //   return routeScreen(
      //       child: UserScreen(
      //     myProfile: kuchbhi,
      //   ));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text('Error Page');
    });
  }

  static Route<dynamic> routeScreen({
    Widget? child,
  }) {
    return MaterialPageRoute(
      // builder: (context) => child!,
      builder: (context) => SafeArea(
        child: child!,
      ),
    );
  }
}
