import 'dart:developer';

import 'package:boardlooker_mobile/models/index.dart';
import 'package:boardlooker_mobile/repositories/index.dart';
import 'package:boardlooker_mobile/shared/index.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final IAuthRepository _repository;
  final SecureStorage _secureStorage;

  AuthBloc(this._repository, this._secureStorage) : super(const AuthState()) {
    on<AuthLogoutRequestedEvent>(_onLogout);
    on<AuthLoginRequestedEvent>(_onLogin);
    on<AuthSignUpRequestedEvent>(_onSignUp);
    on<ClearErrorRequestedEvent>(_onClearError);
  }

  _onLogout(AuthLogoutRequestedEvent event, Emitter<AuthState> emit) {
    _secureStorage.delete(key: "token");
    emit(state.copyWith(authStatus: AuthStatus.unauthorized));
  }

  _onClearError(ClearErrorRequestedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(requestState: RequestState.unknown));
  }
  _onSignUp(AuthSignUpRequestedEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    try{
      var res = await _repository.signUp(
          username: event.username,
          password: event.password,
          fullName: event.fullName,
          birthdate: event.birthdate
      );
      if (res.statusCode != 200) {
        emit(state.copyWith(requestState: RequestState.error));
        return;
      }
      emit(state.copyWith(requestState: RequestState.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  _onLogin(AuthLoginRequestedEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    try {
      var res = await _repository.login(username: event.username, password: event.password);

      if (res.statusCode != 200) {
        emit(state.copyWith(requestState: RequestState.error));
        return;
      }
      _secureStorage.write(key: "username", value: event.username);
      _secureStorage.write(key: "password", value: event.password);
      _secureStorage.write(key: "token", value: res.data['token']);

      var profileRes = await _repository.getProfile();

      if (profileRes.statusCode != 200) {
        emit(state.copyWith(requestState: RequestState.error));
        return;
      }

      emit(state.copyWith(
          requestState: RequestState.success,
          user: User(
              username: event.username,
              password: event.password,
              fullName: profileRes.data["full_name"],
              birthdate: profileRes.data["birthdate"],
          ),
          authStatus: AuthStatus.authorized));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toMap();
}
