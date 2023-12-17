import 'package:boardlooker_mobile/models/index.dart';
import 'package:floor/floor.dart';

@dao
abstract class DatabaseDao {
  @Query('SELECT * FROM locations')
  Stream<List<LocationFloor>> getLocationList();

  // @Query('SELECT * FROM locations WHERE city = (:city) OR location_type = (:locationType)')
  // Stream<List<LocationFloor>> getFilteredLocations({String city = '', String locationType = ''});
  //
  // @Query('SELECT * FROM locations WHERE id = (:id) LIMIT 1')
  // Future<LocationFloor?> getLocationById(int id);

  @Query('SELECT * FROM locations where id NOT IN (:ids)')
  Future<List<LocationFloor>> getUnavailableLocations(List<int> ids);

  @delete
  Future<int> deleteUnavailableLocations(List<LocationFloor> locations);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertLocations(List<LocationFloor> locations);

  @Query('SELECT * FROM boardgames')
  Stream<List<BoardgameFloor>> getBoardgamesList();

  @Query('SELECT * FROM boardgames where id NOT IN (:ids)')
  Future<List<BoardgameFloor>> getUnavailableBoardgames(List<int> ids);

  @delete
  Future<int> deleteUnavailableBoardgames(List<BoardgameFloor> boardgames);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertBoardgames(List<BoardgameFloor> boardgames);

}