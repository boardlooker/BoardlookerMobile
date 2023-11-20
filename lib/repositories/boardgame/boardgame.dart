import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/boardgame/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract interface class IBoardgameRepository {
  Future<Response<dynamic>> getBoardgames();
  Future<Response<dynamic>> getBoardgamesById(int id);
  Future<Response<dynamic>> getBoardgamesByLocationId(int id);
  Future<Response<dynamic>> makeBooking(int id);

  @factoryMethod
  static BoardgameApiRepository create(ApiClient client) => BoardgameApiRepository(client);
}