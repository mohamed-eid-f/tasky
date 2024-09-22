import 'package:flutter/material.dart';

class OfflineException implements Exception {}

class ServerException implements Exception {}

class UnhandledException implements Exception {
  final int code;
  final String message;

  UnhandledException(this.code, this.message);

  printError() {
    debugPrint("STATUS CODE: $code");
    debugPrint("BODY: $message");
  }
}

class UserExistException implements Exception {}

class NotFoundException implements Exception {}

class WrongUserOrPasswordException implements Exception {}

class WrongFieldsException implements Exception {}

class UnAuthorizedException implements Exception {}

class UnProcessableException implements Exception {
  UnProcessableException(this.message);
  String message;
  printError() {
    debugPrint("BODY: $message");
  }
}
