import 'package:dartz/dartz.dart';
import 'package:tasky/features/auth/data/datasources/user_data_source.dart';
import 'package:tasky/features/auth/domain/entity/app_user.dart';
import 'package:tasky/features/auth/domain/repos/user_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/internet_info.dart';

typedef CrudFunction = Future<Unit> Function();

class UserRepoImpl implements UserRepo {
  final UserDataSource userDataSource;
  final InternetInfo internetInfo;

  UserRepoImpl({
    required this.userDataSource,
    required this.internetInfo,
  });

  @override
  Future<Either<Failure, Unit>> createUser(AppUser user) async {
    final userModel = AppUser(
      phone: user.phone,
      password: user.password,
      displayName: user.displayName,
      experienceYears: user.experienceYears,
      address: user.address,
      level: user.level,
    );
    if (await internetInfo.isConnected) {
      try {
        userDataSource.createUser(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
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
  Future<Either<Failure, Unit>> login(String phone, String password) async {
    if (await internetInfo.isConnected) {
      try {
        await userDataSource.login(phone, password);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await internetInfo.isConnected) {
      try {
        await userDataSource.logout();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> refreshToken() async {
    if (await internetInfo.isConnected) {
      try {
        await userDataSource.refreshToken();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
