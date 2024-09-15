import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../repos/user_repo.dart';

class RefreshTokenUsecase {
  final UserRepo repository;
  RefreshTokenUsecase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call() async {
    return await repository.refreshToken();
  }
}
