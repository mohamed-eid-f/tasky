import 'package:dartz/dartz.dart';
import 'package:tasky/features/auth/data/datasources/user_data_source.dart';
import 'package:tasky/features/auth/domain/entity/app_user.dart';
import 'package:tasky/features/auth/domain/repos/user_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/internet_info.dart';

class UserRepoImpl implements UserRepo {
  final UserDataSource userDataSource;
  final InternetInfo internetInfo;

  UserRepoImpl({
    required this.userDataSource,
    required this.internetInfo,
  });

  @override
  Future<Either<Failure, String>> registerUser(AppUser user) async {
    if (await internetInfo.isConnected) {
      try {
        String result = await userDataSource.registerUser(user);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on UserExistException {
        return Left(UserExistFailure());
      } on WrongFieldsException {
        return Left(WrongFieldsFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> getProfile() async {
    if (await internetInfo.isConnected) {
      try {
        final user = await userDataSource.getProfile();
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> login(String phone, String password) async {
    if (await internetInfo.isConnected) {
      try {
        String result = await userDataSource.login(phone, password);
        return Right(result);
      } on WrongUserOrPasswordException {
        return Left(WrongUserOrPasswordFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    if (await internetInfo.isConnected) {
      try {
        String result = await userDataSource.logout();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, String>> refreshToken() async {
    if (await internetInfo.isConnected) {
      try {
        String result = await userDataSource.refreshToken();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
