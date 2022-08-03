import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/detailed_news/detailed_news.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/screens/onboarding/onboarding.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routSettings) {
    switch (routSettings.name) {
      case "/onboarding":
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/detailed":
        final args = routSettings.arguments as ScreenArgs;
        return MaterialPageRoute(
            builder: (_) => DetailesNews(
                  article: args.args['article'],
                ));

      default:
        // return MaterialPageRoute(builder: (_) => SplashScreen());
        return null;
    }
  }
}

class ScreenArgs {
  final Map<String, dynamic> args;
  ScreenArgs({required this.args});
}
