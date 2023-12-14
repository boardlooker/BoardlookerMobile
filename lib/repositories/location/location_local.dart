import 'package:boardlooker_mobile/db/db_client.dart';
import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract interface class ILocationLocalRepository{
  Stream<List<Location>> getLocationList();
  // Stream<List<Location>> getFilteredLocations({
  //   String city = '',
  //   String locationType = ''
  // });
  // Future<Location?> getLocationById(int id);
  saveLocationList(List<Location> locations);
  syncObjects(List<Location> locations);

  @factoryMethod
  static LocationDbRepository create(DbClient dbClient) => LocationDbRepository(dbClient);

}