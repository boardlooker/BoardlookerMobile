import 'package:boardlooker_mobile/models/enums/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boardgame.freezed.dart';
part 'boardgame.g.dart';

@freezed
class Boardgame with _$Boardgame {
  const factory Boardgame({
    required final String title,
    required final String description,
    required final String year,
    @JsonKey(fromJson: Language.languageFromJson, toJson: Language.languageToJson)
    required final Language language,
    @JsonKey(fromJson: Genre.genreFromJson, toJson: Genre.genreToJson)
    required final Genre genre,
  }) = _Boardgame;

  factory Boardgame.fromJson(Map<String, dynamic> json) => _$BoardgameFromJson(json);
}