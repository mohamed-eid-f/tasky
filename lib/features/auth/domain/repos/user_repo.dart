import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/app_user.dart';

abstract class UserRepo {
  Future<Either<Failure, AppUser>> getProfile();
  Future<Either<Failure, Unit>> createUser(AppUser user);
  Future<Either<Failure, Unit>> login(String phone, String password);
  Future<Either<Failure, Unit>> refreshToken();
  Future<Either<Failure, Unit>> logout();
}
