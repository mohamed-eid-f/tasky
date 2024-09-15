import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage;
  const SecureStorage({this.storage = const FlutterSecureStorage()});
// Read value
  Future<String?> readValue({required String key}) async {
    return await storage.read(key: key);
  }

// Delete value
  Future<void> deleteValue({required String key}) async {
    return await storage.delete(key: key);
  }

// Delete all
  Future<void> deleteAllValues() async {
    return await storage.deleteAll();
  }

// Write value
  Future<void> writeValue({required String key, required String value}) async {
    return await storage.write(key: key, value: value);
  }
}
