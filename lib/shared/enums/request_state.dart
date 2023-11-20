enum RequestState {
  loading('loading'),
  error('error'),
  success('success'),
  unknown('unknown');

  const RequestState(this.value);

  final String value;

  static RequestState? fromString(String value) {
    try {
      return RequestState.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
}
