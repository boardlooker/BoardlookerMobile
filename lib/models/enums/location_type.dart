enum LocationType {
  bar("bar"),
  cafe("cafe"),
  hookah("hookah"),
  other("other");

  const LocationType(this.value);

  final String value;

  static LocationType? fromString(String value) {
    try {
      return LocationType.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
}