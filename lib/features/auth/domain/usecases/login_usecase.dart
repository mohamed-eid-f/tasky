import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../repos/user_repo.dart';

class LoginUsecase {
  final UserRepo repository;
  LoginUsecase({
    required this.repository,
  });

  Future<Either<Failure, String>> call(String phone, String password) async {
    return await repository.login(phone, password);
  }
}
