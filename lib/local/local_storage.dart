import 'package:get_storage/get_storage.dart';

mixin LocalStorage {
  void setBatsman1Name(String batsman1Name) {
    final box = GetStorage();
    box.write('batsman1Name', batsman1Name);
  }

  String? getBatsman1Name() {
    final box = GetStorage();
    return box.read('batsman1Name');
  }

  Future<void> removeBatsman1Name() async {
    final box = GetStorage();
    await box.remove('batsman1Name');
  }
}
