import 'dart:async';

import 'package:boardlooker_mobile/models/index.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';

part 'database.g.dart';

@Database(
  version: 1,
  entities: [LocationFloor],
)
abstract class AppDatabase extends FloorDatabase {
  LocationDao get locationDao;
}
