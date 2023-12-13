import 'package:boardlooker_mobile/screens/index.dart';
import 'package:boardlooker_mobile/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Boardlooker',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const RegistrationScreen(),
    );
  }
}
