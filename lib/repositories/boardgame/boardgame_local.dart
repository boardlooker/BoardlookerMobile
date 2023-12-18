import 'package:boardlooker_mobile/db/db_client.dart';
import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract interface class IBoardgameLocalRepository{
  Stream<List<Boardgame>> getBoardgamesList();
  saveBoardgamesList(List<Boardgame> boardgames);
  syncObjects(List<Boardgame> boardgames);

  @factoryMethod
  static BoardgameDbRepository create(DbClient dbClient) => BoardgameDbRepository(dbClient);

}