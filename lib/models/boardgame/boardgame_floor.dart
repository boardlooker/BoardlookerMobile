import 'package:floor/floor.dart';

@Entity(
    tableName: "boardgames"
)
class BoardgameFloor{
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String title;
  final String description;
  final int year;
  final int language;
  final int genre;

  BoardgameFloor({
    required this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.language,
    required this.genre
});
}