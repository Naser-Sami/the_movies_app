import '/core/core.dart';
import '/features/entry_point/entry_point.dart';
import '/features/main_page.dart';
import '/features/movies/movie.dart';
import '/features/onboarding/onboarding.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String entryPoint = "/entry_point";

  static const String authRoute = "/auth";
  static const String registerRoute = "/register";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgot_password";
  static const String homePageRoute = "/home_page";
  static const String settingsPageRoute = "/settings_page";
  static const String profilePageRoute = "/profile_page";

  static const String moviesPage = "/movies_page";
  static const String moviesDetailsPage = "/movies_details_page";
  static const String noInternetConnectionRoute = "/no_internet_connection";
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingPage());

      case Routes.entryPoint:
        return MaterialPageRoute(builder: (context) => const EntryPoint());

      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (context) => const MainPage());

      case Routes.moviesPage:
        return MaterialPageRoute(builder: (context) => const MoviesPage());

      // case Routes.moviesDetailsPage:
      // return MaterialPageRoute(builder: (context) => const MovieDetailScreen(id: null,));

      case Routes.noInternetConnectionRoute:
        return noInternetConnectionRoute();

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(child: Text(AppStrings.noRouteFound)),
          )),
    );
  }

  static Route<dynamic> noInternetConnectionRoute() {
    return MaterialPageRoute(
      builder: ((context) => Scaffold(
            body: Center(
                child: Text(
              DataSource.NO_INTERNET_CONNECTION.getFailure().message,
            )),
          )),
    );
  }
}
