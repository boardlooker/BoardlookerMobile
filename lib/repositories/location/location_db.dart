import 'package:boardlooker_mobile/db/db_client.dart';
import 'package:boardlooker_mobile/models/location/location.dart';
import 'package:boardlooker_mobile/models/location/mapper.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:injectable/injectable.dart';

@Named("LocationDbRepository")
@Injectable(as: ILocationLocalRepository)
class LocationDbRepository implements ILocationLocalRepository{
  final DbClient _dbClient;

  LocationDbRepository(this._dbClient);

  // @override
  // Stream<List<Location>> getFilteredLocations({String city = '', String locationType = ''}) {
  //   return _dbClient.dbClient.locationDao
  //       .getFilteredLocations(city: city, locationType: locationType)
  //       .asyncMap((locations) => locations.map((e) => e.toLocationDto()).toList());
  // }

  @override
  Stream<List<Location>> getLocationList() {
    return _dbClient.dbClient.dbDao
        .getLocationList()
        .asyncMap((locations) => locations.map((e) => e.toLocationDto()).toList());
  }

  @override
  saveLocationList(List<Location> locations) async {
    return await _dbClient.dbClient.dbDao
        .insertLocations(locations.map((e) => e.toLocationFloor()).toList());
  }

  @override
  Future<int> syncObjects(List<Location> locations) async {
    var locationForDelete = await _dbClient.dbClient.dbDao.getUnavailableLocations(locations.map((e) => e.id).toList());

    return await _dbClient.dbClient.dbDao.deleteUnavailableLocations(locationForDelete);
  }

  // @override
  // Future<Location?> getLocationById(int id) {
  //   return _dbClient.dbClient.locationDao
  //       .getLocationById(id).then((value) => value?.toLocationDto());
  // }
  
}