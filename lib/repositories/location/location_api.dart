import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Named("LocationApiRepository")
@Injectable(as: ILocationRepository)
class LocationApiRepository implements ILocationRepository{
  final ApiClient _client;

  LocationApiRepository(this._client);

  @override
  Future<Response> getLocationBookingByDay(int locId, String day) {
    return _client.getLocationBookingByDay(locId, day);
  }

  @override
  Future<Response> getLocationById(int id) {
    return _client.getLocationById(id);
  }

  @override
  Future<Response> getLocations(String? city, String? nameRegex, String? locType) {
    return _client.getLocations(city, nameRegex, locType);
  }

}