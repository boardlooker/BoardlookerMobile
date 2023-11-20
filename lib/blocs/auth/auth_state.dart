part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final RequestState? requestState;
  final User? user;

  const AuthState({
    this.requestState = RequestState.unknown,
    this.authStatus = AuthStatus.unauthorized,
    this.user,
  });

  @override
  List<dynamic> get props => [authStatus, user, requestState];

  AuthState copyWith({
    RequestState? requestState,
    AuthStatus? authStatus,
    User? user,
  }) {
    return AuthState(
      requestState: requestState ?? this.requestState,
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      authStatus: AuthStatus.fromString(map['authStatus']) ?? AuthStatus.unauthorized,
      user: map['user'] != null ? User.fromJson(map['user']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authStatus': authStatus.value,
      'user': user?.toJson(),
    };
  }
}