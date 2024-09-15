import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/app_user.dart';
import '../repos/user_repo.dart';

class CreateUserUsecase {
  final UserRepo repository;
  CreateUserUsecase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call(AppUser user) async {
    return await repository.createUser(user);
  }
}
