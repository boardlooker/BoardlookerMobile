part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginRequestedEvent extends AuthEvent {
  AuthLoginRequestedEvent({required this.username, required this.password});
  String username;
  String password;
}

class AuthLogoutRequestedEvent extends AuthEvent {}

class AuthSignUpRequestedEvent extends AuthEvent {
  AuthSignUpRequestedEvent({
    required this.username,
    required this.password,
    required this.fullName,
    required this.birthdate,
  });

  String username;
  String password;
  String fullName;
  String birthdate;
}

class ClearErrorRequestedEvent extends AuthEvent {}