import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:boardlooker_mobile/models/index.dart';

extension BoardgameDtoExtension on Boardgame{
  BoardgameFloor toBoardgameFloor(){
    return BoardgameFloor(
      id: id,
      title: title,
      description: description,
      year: year,
      language: Language.languageToJson(language),
      genre: Genre.genreToJson(genre),
    );
  }
}

extension BoardgameFloorExtension on BoardgameFloor{
  Boardgame toBoardgameDto(){
    return Boardgame(
      id: id,
      title: title,
      description: description,
      year: year,
      language: Language.fromString(language)!,
      genre: Genre.fromString(genre)!,
    );
  }
}