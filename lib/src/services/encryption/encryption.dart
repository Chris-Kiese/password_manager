import 'package:encrypt/encrypt.dart';
import 'package:password_manager/src/constant/keys/keys.dart';
import 'package:password_manager/src/constant/storage/storage.dart';

Future<String> encrypt(String password) async {
  String _masterKey = await masterKey32();

  final key = Key.fromUtf8(_masterKey);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));

  return encrypter.encrypt(password, iv: iv).base64; //encrypted
}

Future<String> decrypt(String encrypted) async {
  String _masterKey = await masterKey32();

  final key = Key.fromUtf8(_masterKey);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));

  return encrypter.decrypt64(encrypted, iv: iv); //decrypted
}

Future<String> masterKey32() async {
  String? _masterKeyNullable = await secureStorage.read(key: masterKey);
  String _masterKey = _masterKeyNullable!;

  if (_masterKey.length < 32) {
    int remaining = (32 - masterKey.length);
    for (int i = 0; i < remaining; i++) {
      //TODO: add more secure chars from env
      _masterKey += '.'; //Add another char to the key
    }
  }
  return _masterKey;
}
