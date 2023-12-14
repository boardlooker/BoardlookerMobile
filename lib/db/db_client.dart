import 'dart:developer';

import 'package:boardlooker_mobile/shared/index.dart';
import 'package:injectable/injectable.dart';

import 'database.dart';

@singleton
class DbClient {
  late AppDatabase dbClient;

  Future<bool> initDb() async {
    try {
      dbClient = await $FloorAppDatabase.databaseBuilder(Constants.dbName).build();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
