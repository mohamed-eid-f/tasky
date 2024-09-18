import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/app_user.dart';

abstract class UserRepo {
  Future<Either<Failure, AppUser>> getProfile();
  Future<Either<Failure, String>> registerUser(AppUser user);
  Future<Either<Failure, String>> login(String phone, String password);
  Future<Either<Failure, String>> refreshToken();
  Future<Either<Failure, String>> logout();
}
