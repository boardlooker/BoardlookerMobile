import 'package:boardlooker_mobile/models/boardgame/boardgame_floor.dart';
import 'package:floor/floor.dart';

@dao
abstract class BoardgameDao{
  @Query('SELECT * FROM boardgames')
  Stream<List<BoardgameFloor>> getLocationList();

  @Query('SELECT * FROM boardgames where id NOT IN (:ids)')
  Future<List<BoardgameFloor>> getUnavailableLocations(List<int> ids);

  @delete
  Future<int> deleteUnavailableLocations(List<BoardgameFloor> locations);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertLocations(List<BoardgameFloor> locations);
}