import 'package:boardlooker_mobile/models/index.dart';
import 'package:floor/floor.dart';

@dao
abstract class LocationDao {
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

}