import 'package:boardlooker_mobile/screens/index.dart';
import 'package:boardlooker_mobile/shared/enums/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter authRouter() {
  return GoRouter(
    initialLocation: Routes.root.name,
    routes: [
      GoRoute(
        path: Routes.root.name,
        pageBuilder: (context, state) => const MaterialPage(child: RootScreen()),
      ),
      GoRoute(
        path: Routes.login.name,
        pageBuilder: (context, state) => const MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        path: Routes.registration.name,
        pageBuilder: (context, state) => const MaterialPage(child: RegistrationScreen()),
      ),
    ],
  );
}