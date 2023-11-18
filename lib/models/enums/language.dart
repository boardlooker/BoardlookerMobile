enum Language{
  russian(1),
  english(2);

  const Language(this.value);

  final int value;

  static Language? fromString(int value) {
    try {
      return Language.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
  static int languageToJson(Language genre) {
    return genre.index;
  }

  static Language languageFromJson(dynamic json) {
    return Language.values[json as int];
  }
}