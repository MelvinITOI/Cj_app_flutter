import 'package:localstorage/localstorage.dart';
import 'package:encrypt/encrypt.dart';

class FileStore {
  late LocalStorage storage;
  late Key eKey;
  late IV eIV;
  late Encrypter encrypter;
  static final FileStore _instance = FileStore._internal();

  factory FileStore() {
    return _instance;
  }

  FileStore._internal() {
    storage = LocalStorage('cj-app');
    eKey = Key.fromUtf8('Zr4u7x!A%D*G-JaNdRgUkXp2s5v8y/B?');
    eIV = IV.fromUtf8('bPeSgVkYp3s6v9y^');
    encrypter = Encrypter(AES(eKey));
  }

  void add(key, value, {isSecure = false}) {
    if (isSecure) {
      value = encrypter.encrypt(value, iv: eIV).base64;
    }

    storage.setItem(key, value);
  }

  dynamic get(key, {isSecure = false}) {
    dynamic value = storage.getItem(key);

    if (isSecure) {
      value = encrypter.decrypt64(value, iv: eIV);
    }
    return value;
  }

  void remove(key) {
    storage.deleteItem(key);
  }

  void clear() {
    storage.clear();
  }
}
