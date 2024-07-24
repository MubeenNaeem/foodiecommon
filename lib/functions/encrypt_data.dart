import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:nanoid/nanoid.dart';

String encryptData(
  Map<String, dynamic> data, [
  double encryptionKeyPositionPercent = 0.1,
  double ivKeyPositionPercent = 0.6,
]) {
  final encryptionKey = nanoid(16);
  final ivKey = nanoid(16);

  final key = Key.fromUtf8(encryptionKey);
  final iv = IV.fromUtf8(ivKey);

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(jsonEncode(data), iv: iv).base64;

  final encryptionKeyPosition =
      (encrypted.length * encryptionKeyPositionPercent).round();

  final encryptedWithKey = encrypted.substring(0, encryptionKeyPosition) +
      encryptionKey +
      encrypted.substring(encryptionKeyPosition);

  final ivKeyPosition =
      (encryptedWithKey.length * ivKeyPositionPercent).round();

  final encryptedWithBothKeys = encryptedWithKey.substring(0, ivKeyPosition) +
      ivKey +
      encryptedWithKey.substring(ivKeyPosition);

  return encryptedWithBothKeys;
}

Map<String, dynamic> decryptData(String encryptedData,
    double encryptionKeyPositionPercent, double ivKeyPositionPercent) {
  final lengthWithIv = encryptedData.length - 16;
  final ivPosition = (lengthWithIv * ivKeyPositionPercent).round();
  final ivKey = encryptedData.substring(ivPosition, ivPosition + 16);
  final encryptedWithoutIvKey = encryptedData.substring(0, ivPosition) +
      encryptedData.substring(ivPosition + 16);

  final lengthWithKey = encryptedWithoutIvKey.length - 16;
  final keyPosition = (lengthWithKey * encryptionKeyPositionPercent).round();
  final encryptionKey =
      encryptedWithoutIvKey.substring(keyPosition, keyPosition + 16);
  final encryptedWithoutBothKeys =
      encryptedWithoutIvKey.substring(0, keyPosition) +
          encryptedWithoutIvKey.substring(keyPosition + 16);

  final key = Key.fromUtf8(encryptionKey);
  final iv = IV.fromUtf8(ivKey);
  final encrypter = Encrypter(
    AES(key, mode: AESMode.cbc, padding: 'PKCS7'),
  );

  final decrypted = encrypter.decrypt(
    Encrypted.fromBase64(encryptedWithoutBothKeys),
    iv: iv,
  );

  final decryptedData = jsonDecode(decrypted);
  return decryptedData;
}
