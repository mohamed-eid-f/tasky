import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongFieldsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserExistFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongUserOrPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];
}
