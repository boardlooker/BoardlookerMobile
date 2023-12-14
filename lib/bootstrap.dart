import 'package:boardlooker_mobile/blocs/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:boardlooker_mobile/router/index.dart';
import 'package:boardlooker_mobile/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class Bootstrap extends StatelessWidget {
  const Bootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
                  AuthBloc(
                      GetIt.instance.get<IAuthRepository>(),
                      GetIt.instance.get<SecureStorage>()
                  )
          ),
          BlocProvider(
            create: (BuildContext context) => InternetAccessCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => FilesystemBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => LocationBloc(
                GetIt.instance.get<ILocationRepository>(),
                GetIt.instance.get<ILocationLocalRepository>()
            ),
          ),
        ],
        child: BlocListener<InternetAccessCubit, InternetAccessState>(
          listener: (context, state) {},
          child: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) => previous.authStatus != current.authStatus,
            builder: (context, state) {
              return MaterialApp.router(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('ru', 'RU'),
                ],
                routerConfig: authRouter(),
                theme: ThemeData(
                  colorScheme: colorScheme,
                  useMaterial3: true,
                ),
                title: 'Boardlooker',
              );
            },

        )
    ));
  }
}
