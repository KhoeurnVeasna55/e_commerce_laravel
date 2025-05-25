import 'package:get_storage/get_storage.dart';

class StoreWellcome {
  final _getStorage = GetStorage();
  Future<void> saveWellcomeScreen(bool status)async{
    await _getStorage.write('wellcomePage', status);
  }
  Future<bool> getWellcomePage() async {
    return  _getStorage.read('wellcomePage') ?? false;
  }
}