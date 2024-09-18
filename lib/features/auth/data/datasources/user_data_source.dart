import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tasky/core/storage/secure_storage.dart';

import '../../../../core/consts/consts.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entity/app_user.dart';
import '../models/user_model.dart';

abstract class UserDataSource {
  Future<AppUser> getProfile();
  Future<String> registerUser(AppUser user);
  Future<String> login(String phone, String password);
  Future<String> refreshToken();
  Future<String> logout();
}

class UserDataSourceWithHttp implements UserDataSource {
  final http.Client client;

  UserDataSourceWithHttp({required this.client});

  @override
  Future<String> registerUser(AppUser user) async {
    final Map<String, dynamic> body = {
      'phone': user.phone,
      'password': user.password,
      'displayName': user.displayName,
      'experienceYears': user.experienceYears.toString(),
      'address': user.address,
      'level': user.level,
    };
    final response = await client.post(
      Uri.parse("$kBaseUrl/auth/register"),
      body: body,
    );
    print(response.body);

    if (response.statusCode == 201) {
      SecureStorage storage = const SecureStorage();
      var jsonResponse = jsonDecode(response.body);
      await storage.writeValue(key: kId, value: jsonResponse["_id"]);
      await storage.writeValue(
          key: kDisplayName, value: jsonResponse["displayName"]);
      await storage.writeValue(
          key: kAccessToken, value: jsonResponse["access_token"]);
      await storage.writeValue(
          key: kRefreshToken, value: jsonResponse["refresh_token"]);
      return Future.value(kSuccess);
    } else if (response.statusCode == 422) {
      throw UserExistException();
    } else if (response.statusCode == 500) {
      throw WrongFieldsException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AppUser> getProfile() async {
    final token = await const SecureStorage().readValue(key: kAccessToken);

    final Map<String, String> headers = {"Authorization": "Bearer $token"};
    final response = await client.get(
      Uri.parse("$kBaseUrl/auth/profile"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      AppUser user = UserModel.fromJson(jsonDecode(response.body));
      return Future.value(user);
    } else if (response.statusCode == 401) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> login(String phone, String password) async {
    final Map<String, dynamic> body = {
      'phone': phone,
      'password': password,
    };
    final response = await client.post(
      Uri.parse("$kBaseUrl/auth/login/"),
      body: body,
    );
    // print("response: ${response.statusCode}");
    if (response.statusCode == 201) {
      SecureStorage storage = const SecureStorage();
      await storage.deleteAllValues();

      var jsonResponse = jsonDecode(response.body);
      await storage.writeValue(key: kId, value: jsonResponse["_id"]);
      await storage.writeValue(
          key: kAccessToken, value: jsonResponse["access_token"]);
      await storage.writeValue(
          key: kRefreshToken, value: jsonResponse["refresh_token"]);
      return Future.value(kSuccess);
    } else if (response.statusCode == 401) {
      throw WrongUserOrPasswordException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> logout() async {
    final token = await const SecureStorage().readValue(key: kAccessToken);
    final Map<String, String> headers = {"Authorization": "Bearer $token"};
    print('token: $headers');

    final response = await client.post(
      Uri.parse("$kBaseUrl/auth/logout"),
      headers: headers,
    );

    if (response.statusCode == 201) {
      await const SecureStorage().deleteAllValues();
      print("LOGGED OUT SUCCESSFULLY");

      return Future.value(kSuccess);
    } else if (response.statusCode == 401) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> refreshToken() async {
    SecureStorage storage = const SecureStorage();
    String refreshToken = (await storage.readValue(key: kRefreshToken)) ?? "";
    final response = await client.get(
      Uri.parse("$kBaseUrl/auth/refresh-token?token=$refreshToken/"),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      await storage.writeValue(
          key: kAccessToken, value: jsonResponse["access_token"]);
      return Future.value(kSuccess);
    } else if (response.statusCode == 403) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}

// PostRemoteDataSourceWithDio