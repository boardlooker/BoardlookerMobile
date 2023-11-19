import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorage {
  late final FlutterSecureStorage _storage;

  SecureStorage() {
    _storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock ));
  }

  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  void delete({required String key}) async {
    return await _storage.delete(key: key);
  }

  void deleteAll() async {
    return await _storage.deleteAll();
  }

  void write({required String key, required String value}) async {
    return await _storage.write(key: key, value: value);
  }
}