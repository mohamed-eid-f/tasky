import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? id;
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String address;
  final String level;
  const AppUser({
    this.id,
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

  @override
  List<Object?> get props =>
      [phone, password, displayName, experienceYears, address, level, id];
}
