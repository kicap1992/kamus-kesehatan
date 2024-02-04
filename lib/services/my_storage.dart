import 'package:get_storage/get_storage.dart';

class MyStorage {
  final box = GetStorage();

  init() async {
    await GetStorage.init();
  }

  write(String key, dynamic value) async {
    await box.write(key, value);
  }

  read(String key) {
    return box.read(key);
  }

  remove(String key) async {
    await box.remove(key);
  }

  clear() async {
    await box.erase();
  }
}
