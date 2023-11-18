enum Genre{
  other(0),
  cards(1),
  quest(2),
  realism(3),
  logic(5),
  desktop(6);

  const Genre(this.value);

  final int value;

  static Genre? fromString(int value) {
    try {
      return Genre.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
  static int genreToJson(Genre genre) {
    return genre.index;
  }

  static Genre genreFromJson(dynamic json) {
    return Genre.values[json as int];
  }

}