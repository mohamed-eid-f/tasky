import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../repos/user_repo.dart';

class LogoutUsecase {
  final UserRepo repository;
  LogoutUsecase({
    required this.repository,
  });

  Future<Either<Failure, String>> call() async {
    return await repository.logout();
  }
}
