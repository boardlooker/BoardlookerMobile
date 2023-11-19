import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/auth/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Named("AuthApiRepository")
@Injectable(as: IAuthRepository)
class AuthApiRepository implements IAuthRepository {
  final ApiClient _client;

  AuthApiRepository(this._client);

  @override
  Future<Response<dynamic>> login({required String username, required String password}) {
    return _client.login(password: password, username: username);
  }

  @override
  Future<Response> signUp({
    required String username,
    required String password,
    required String fullName,
    required String birthdate,
  }) {
    return _client.signUp(
        username: username,
        password: password,
        fullName: fullName,
        birthdate: birthdate
    );
  }
}
