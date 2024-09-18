import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/app_user.dart';
import '../repos/user_repo.dart';

class RegisterUserUsecase {
  final UserRepo repository;
  RegisterUserUsecase({
    required this.repository,
  });

  Future<Either<Failure, String>> call(AppUser user) async {
    return await repository.registerUser(user);
  }
}
