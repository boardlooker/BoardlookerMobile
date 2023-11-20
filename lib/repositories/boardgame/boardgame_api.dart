import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/boardgame/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@Named("BoardgameApiRepository")
@Injectable(as: IBoardgameRepository)
class BoardgameApiRepository implements IBoardgameRepository {
  final ApiClient _client;

  BoardgameApiRepository(this._client);

  @override
  Future<Response> getBoardgames() {
    return _client.getBoardgames();
  }

  @override
  Future<Response> getBoardgamesById(int id) {
    return _client.getBoardgamesById(id);
  }

  @override
  Future<Response> getBoardgamesByLocationId(int id) {
    return _client.getBoardgamesByLocationId(id);
  }

  @override
  Future<Response> makeBooking(int id) {
    return _client.makeBooking(id);
  }
}
