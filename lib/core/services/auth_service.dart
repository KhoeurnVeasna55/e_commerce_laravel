import 'package:get_storage/get_storage.dart';

class AuthService {
  final _storeToken = GetStorage();

  Future<void> saveToken(String accessToken) async {
    return await _storeToken.write('store_token', accessToken);
  }

  Future<bool> getToken() async {
    return await _storeToken.read('store_token') ?? false;
  }

  Future<void> removeToken() async {
    return await _storeToken.remove('store_token');
  }
}
