import 'package:boardlooker_mobile/db/db_client.dart';
import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:injectable/injectable.dart';

@Named("BoardgameDbRepository")
@Injectable(as: IBoardgameLocalRepository)
class BoardgameDbRepository implements IBoardgameLocalRepository{
  final DbClient _dbClient;

  BoardgameDbRepository(this._dbClient);

  @override
  Stream<List<Boardgame>> getBoardgamesList() {
    return _dbClient.dbClient.dbDao
        .getBoardgamesList()
        .asyncMap((boardgames) => boardgames.map((e) => e.toBoardgameDto()).toList());
  }

  @override
  saveBoardgamesList(List<Boardgame> boardgames) async {
    return await _dbClient.dbClient.dbDao
        .insertBoardgames(boardgames.map((e) => e.toBoardgameFloor()).toList());
  }

  @override
  syncObjects(List<Boardgame> boardgames) async{
    var boardgamesForDelete = await _dbClient.dbClient.dbDao.getUnavailableBoardgames(boardgames.map((e) => e.id).toList());

    return await _dbClient.dbClient.dbDao.deleteUnavailableBoardgames(boardgamesForDelete);

  }

}