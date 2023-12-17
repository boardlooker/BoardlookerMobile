import 'package:boardlooker_mobile/screens/index.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter() {
  return GoRouter(
    initialLocation: Routes.city.name,
    routes: [
      GoRoute(
        path: Routes.city.name,
        name: Routes.city.name,
        builder: (context, state) => CityScreen(selectedCity: state.queryParameters['city']),
      ),
      GoRoute(
        path: Routes.location.name,
        name: Routes.location.name,
        builder: (context, state) => LocationScreen(city: state.queryParameters['city']!),
      ),
    ],
  );
}