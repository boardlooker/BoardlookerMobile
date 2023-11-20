import 'package:boardlooker_mobile/shared/index.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClient {
  final Dio _dioClient = Dio();
  final SecureStorage _secureStorage;

  ApiClient(this._secureStorage) {
    _dioClient
      ..options.baseUrl = Constants.apiUrl
    // ..interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90))
      ..options.connectTimeout = const Duration(seconds: 20)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          var token = await _secureStorage.read(key: 'token');
          if (token != null) {
            options.headers['Authorization'] = token;
          }
          return handler.next(options);
        },
      ));
  }

  Future<Response<dynamic>> login({required String username, required String password}) {
    return _dioClient.post('/users/signin',
        data: FormData.fromMap({
          'username': username,
          'password': password,
        }),
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  Future<Response<dynamic>> signUp({
    required String username,
    required String password,
    required String fullName,
    required String birthdate,
  }) {
    return _dioClient.post('/users/signin',
        data: FormData.fromMap({
          'username': username,
          'password': password,
          'full_name': fullName,
          'birthdate': birthdate
        }),
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  Future<Response<dynamic>> getProfile() {
    return _dioClient.get('/api/users/me',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }

  Future<Response<dynamic>> getProfileData(){
    return _dioClient.get('/users/me',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }

  Future<Response<dynamic>> getBoardgames(){
    return _dioClient.get('/boardgames/',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  Future<Response<dynamic>> getBoardgamesById(int id){
    return _dioClient.get('/boardgames/$id',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  Future<Response<dynamic>> getBoardgamesByLocationId(int id){
    return _dioClient.get('/boardgames/$id/',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  Future<Response<dynamic>> makeBooking(int id){
    return _dioClient.post('/boardgames/$id/',
        options: Options(sendTimeout: const Duration(seconds: 50), receiveTimeout: const Duration(seconds: 60)));
  }
  }