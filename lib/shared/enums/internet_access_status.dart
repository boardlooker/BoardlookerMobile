enum InternetAccessStatus {
  online('online'),
  offline('offline'),
  unknown('unknown');

  const InternetAccessStatus(this.value);

  final String value;

  static InternetAccessStatus? fromString(String value) {
    try {
      return InternetAccessStatus.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
}