import '../../domain/entity/app_user.dart';

class UserModel extends AppUser {
  const UserModel({
    super.id,
    required super.phone,
    required super.password,
    required super.displayName,
    required super.experienceYears,
    required super.address,
    required super.level,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        phone: json['username'],
        password: json['password'],
        displayName: json['displayName'],
        experienceYears: json['experienceYears'],
        address: json['address'],
        level: json['level'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': phone,
        'password': password,
        'displayName': displayName,
        'experienceYears': experienceYears,
        'address': address,
        'level': level,
      };
}
