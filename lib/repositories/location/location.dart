import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract interface class ILocationRepository {
  Future<Response<dynamic>> getLocations(String? city, String? nameRegex, String? locType);
  Future<Response<dynamic>> getLocationById(int id);
  Future<Response<dynamic>> getLocationBookingByDay(int locId, String day);
  @factoryMethod
  static LocationApiRepository create(ApiClient client) => LocationApiRepository(client);
}