import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:boardlooker_mobile/bootstrap.dart';
import 'package:boardlooker_mobile/di/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await runZonedGuarded(() async {
    await dotenv.load(fileName: ".env", mergeWith: Platform.environment);
    configureDependencies();
    // Bloc.observer = BlocGlobalObserver();
    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const Bootstrap());
  }, (exception, stackTrace) {
     log(stackTrace.toString());
  });
}