import 'package:boardlooker_mobile/screens/city_screen.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter() {
  return GoRouter(
    initialLocation: Routes.city.name,
    routes: [
      GoRoute(
        path: Routes.city.name,
        builder: (context, state) => CityScreen(selectedCity: state.queryParameters['city']),
      ),
    ],
  );
}