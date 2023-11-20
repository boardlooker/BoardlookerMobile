enum AuthStatus {
  authorized('authorized'),
  unauthorized('unauthorized');

  const AuthStatus(this.value);

  final String value;

  static AuthStatus? fromString(String value) {
    try {
      return AuthStatus.values.firstWhere((status) => status.value == value);
    } catch (e) {
      return null;
    }
  }
}