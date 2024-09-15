import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/app_user.dart';
import '../repos/user_repo.dart';

class GetAppUserUsecase {
  final UserRepo repository;
  GetAppUserUsecase({
    required this.repository,
  });

  Future<Either<Failure, AppUser>> call() async {
    return await repository.getProfile();
  }
}
