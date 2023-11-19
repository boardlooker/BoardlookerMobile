import 'package:boardlooker_mobile/client/index.dart';
import 'package:boardlooker_mobile/repositories/auth/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract interface class IAuthRepository {
  Future<Response<dynamic>> login({required String username, required String password});
  Future<Response<dynamic>> signUp({
    required String username,
    required String password,
    required String fullName,
    required String birthdate,
  });

  @factoryMethod
  static AuthApiRepository create(ApiClient client) => AuthApiRepository(client);
}
